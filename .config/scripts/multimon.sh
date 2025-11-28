#!/bin/bash

TARGET_MONITOR="DP-1" 

windows=$(niri msg --json windows | jq -r '.[].id')

if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed."
    exit 1
fi

if ! pgrep -x niri > /dev/null; then
    echo "Error: niri doesn't appear to be running."
    exit 1
fi

for window_id in $windows; do
    echo "Moving window $window_id to $TARGET_MONITOR"
    niri msg action move-window-to-monitor --id "$window_id" "$TARGET_MONITOR"
done

echo "All windows moved to $TARGET_MONITOR"
