#!/bin/bash

export HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/$(id -u)/hypr/ | head -1)

hyprctl keyword monitor "DP-1,3440x1440@59.973,1920x0,1"
hyprctl keyword monitor "HDMI-A-1,1920x1080@60,0x0,1"

# Force DPMS off then on to wake monitors
hyprctl dispatch dpms off
sleep 1
hyprctl dispatch dpms on
