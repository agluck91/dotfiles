#!/usr/bin/env bash
# Cycle through wallpapers in ~/Backgrounds alphabetically.
# Tracks the current wallpaper in a state file.

BACKGROUNDS_DIR="$HOME/Backgrounds"
STATE_FILE="/tmp/awww-wallpaper-index"

shopt -s nullglob nocaseglob
images=("$BACKGROUNDS_DIR"/*.jpg "$BACKGROUNDS_DIR"/*.jpeg "$BACKGROUNDS_DIR"/*.png "$BACKGROUNDS_DIR"/*.webp)
shopt -u nullglob nocaseglob

count=${#images[@]}
if [[ $count -eq 0 ]]; then
    exit 1
fi

current=0
if [[ -f "$STATE_FILE" ]]; then
    current=$(cat "$STATE_FILE")
fi

next=$(( (current + 1) % count ))
echo "$next" > "$STATE_FILE"

awww img "${images[$next]}" --resize crop --transition-step 15 --transition-type grow
