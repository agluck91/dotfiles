#!/usr/bin/env bash

MON="eDP-1"   # change if needed

current_scale=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$MON\").scale")

if [[ "$current_scale" == "1.25" ]]; then
  # Game mode – native scale 1.0
  hyprctl keyword monitor "$MON,preferred,0x0,1"
else
  # Work mode – comfy 125%
  hyprctl keyword monitor "$MON,preferred,0x0,1.25"
fi
