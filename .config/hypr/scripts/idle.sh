#! /bin/env bash
brightness=$(brightnessctl g) && \
swayidle \
    timeout 300 'brightnessctl set 10%' \
    timeout 600 'hyprlock' \
    timeout 900 'hyprctl dispatch dpms off' \
    timeout 1200 'systemctl hibernate' \
    resume "brightnessctl set $brightness; hyprctl dispatch dpms on"

