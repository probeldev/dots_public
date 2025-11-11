#!/bin/bash

BATT_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT_INFO" | grep 'AC Power')

if [ -z "$PERCENTAGE" ]; then
    exit 0
fi

# Nerd Font battery icons
case ${PERCENTAGE} in
    9[0-9]|100) ICON="󰁹" ;;
    8[0-9]) ICON="󰂂" ;;
    7[0-9]) ICON="󰂁" ;;
    6[0-9]) ICON="󰂀" ;;
    5[0-9]) ICON="󰁿" ;;
    4[0-9]) ICON="󰁾" ;;
    3[0-9]) ICON="󰁽" ;;
    2[0-9]) ICON="󰁼" ;;
    1[0-9]) ICON="󰁺" ;;
    *) ICON="󰂎"
esac

if [[ $CHARGING != "" ]]; then
    ICON="󰂄"
fi

sketchybar -m --set battery icon="$ICON" label="${PERCENTAGE}%"
