#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Батарея: процент + цвет/иконка по уровню и зарядке
PERCENTAGE=$(pmset -g batt | grep -Eo '[0-9]+%' | cut -d% -f1)
[ -z "$PERCENTAGE" ] && exit 0

CHARGING=$(pmset -g batt | grep 'AC Power')

case "$PERCENTAGE" in
  9[0-9] | 100) ICON="󰁹" ;;
  [6-8][0-9]) ICON="󰂂" ;;
  [3-5][0-9]) ICON="󰁾" ;;
  [1-2][0-9]) ICON="󰁻" ;;
  *) ICON="󰂎" ;;
esac

COLOR=0xffcdd6f4
if [ "$PERCENTAGE" -le 20 ]; then
  COLOR=0xfff38ba8
fi
if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR=0xffa6e3a1
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="$PERCENTAGE%"
