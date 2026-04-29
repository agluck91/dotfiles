#!/usr/bin/env bash
# Launch apps to their designated workspaces
# Usage: launch-layout.sh
# Uses [workspace N silent] to spawn apps without switching workspaces

# Workspace 1 — Zen Browser
hyprctl dispatch exec [workspace 1 silent] zen-browser

# Workspace 2 — Two Ghostty terminals
hyprctl dispatch exec [workspace 2 silent] ghostty
hyprctl dispatch exec [workspace 2 silent] ghostty msg new-window

# Workspace 3 — Comms (Vesktop, Slack, Telegram)
hyprctl dispatch exec [workspace 3 silent] vesktop
hyprctl dispatch exec [workspace 3 silent] slack
hyprctl dispatch exec [workspace 3 silent] Telegram

# Workspace 4 — Notion
hyprctl dispatch exec [workspace 4 silent] notion-app
