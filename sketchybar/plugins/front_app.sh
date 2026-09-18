#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Название активного приложения
if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO"
fi
