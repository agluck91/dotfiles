#!/usr/bin/env bash
# Debounced monitor watcher to replace kanshi for simple dock/undock
# Behavior:
# - If HDMI-A-1 is present, disable eDP-1
# - If HDMI-A-1 is absent, enable eDP-1 with preferred mode and scale 1.25
# - Only apply after topology is stable for 3 consecutive checks
# - Never reloads Hyprland; uses hyprctl keyword monitor

set -euo pipefail
LOG=${LOG:-/tmp/hypr-monitor-watch.log}
SCALE=${SCALE:-1.25}
STABLE_N=${STABLE_N:-3}
INTERVAL=${INTERVAL:-1}

hash_file=/tmp/hypr-monitors.hash
stable_count=0
prev_hash=""

hash_monitors() {
  hyprctl -j monitors 2>/dev/null | sha1sum | awk '{print $1}' || echo "no-monitors"
}

has_hdmi() {
  hyprctl -j monitors 2>/dev/null | jq -e '.[] | select(.name=="DP-1" and .active==true)' >/dev/null 2>&1
}

apply_layout() {
  if has_hdmi; then
    echo "$(date) DP-1 present -> disable eDP-1" >>"$LOG"
    hyprctl keyword monitor "eDP-1, disable" >/dev/null 2>&1 || true
  else
    echo "$(date) DP-1 absent  -> enable eDP-1 preferred scale ${SCALE}" >>"$LOG"
    hyprctl keyword monitor "eDP-1, preferred, auto, ${SCALE}" >/dev/null 2>&1 || true
  fi
}

# Wait a moment on startup so Hyprland settles
sleep 1

# Initialize hash
prev_hash=$(hash_monitors)
echo "$prev_hash" >"$hash_file"

while :; do
  sleep "$INTERVAL"
  cur_hash=$(hash_monitors)
  if [[ "$cur_hash" == "$prev_hash" ]]; then
    ((stable_count++))
  else
    stable_count=0
    prev_hash="$cur_hash"
    echo "$cur_hash" >"$hash_file"
    echo "$(date) topology changed, waiting to stabilize" >>"$LOG"
    continue
  fi

  if (( stable_count >= STABLE_N )); then
    # Reset to avoid repeated applies without real changes
    stable_count=0
    apply_layout
  fi

done
