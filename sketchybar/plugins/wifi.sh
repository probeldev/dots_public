#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Wi-Fi: SSID (если macOS отдаёт) или просто статус on/off
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ -n "$SSID" ]; then
  sketchybar --set "$NAME" icon="󰤨" label="$SSID"
else
  WIFI=$(networksetup -getairportpower en0 2>/dev/null | awk '{print $4}')
  if [ "$WIFI" = "On" ]; then
    sketchybar --set "$NAME" icon="󰤨" label=""
  else
    sketchybar --set "$NAME" icon="󰤭" label="off"
  fi
fi
