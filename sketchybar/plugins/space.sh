#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Подсветка активного спейса
if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xff89b4fa \
    icon.color=0xff11111b
else
  sketchybar --set "$NAME" \
    background.drawing=off \
    icon.color=0xffa6adc8
fi
