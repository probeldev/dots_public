#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Громкость: обновляется по событию volume_change и по таймеру
if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)
fi

case "$VOLUME" in
  [6-9][0-9] | 100) ICON="󰕾" ;;
  [3-5][0-9]) ICON="󰖀" ;;
  [1-9] | [1-2][0-9]) ICON="󰕿" ;;
  *) ICON="󰖁" ;;
esac

sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
