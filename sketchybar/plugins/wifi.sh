#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Wi-Fi: только статус on/off, без SSID (на macOS он всё равно "<redacted>",
# плюс не светить название сети на скринкастах)
WIFI=$(networksetup -getairportpower en0 2>/dev/null | awk '{print $4}')
if [ "$WIFI" = "On" ]; then
  sketchybar --set "$NAME" icon="󰤨" label=""
else
  sketchybar --set "$NAME" icon="󰤭" label="off"
fi
