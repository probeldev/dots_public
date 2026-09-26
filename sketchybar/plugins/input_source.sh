#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Текущая раскладка клавиатуры: RU/EN
SRC=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null \
  | awk -F'= ' '/KeyboardLayout Name/ { gsub(/[";]/, "", $2); print $2; exit }')

case "$SRC" in
  Russian*|Рус*) LAYOUT="RU" ;;
  *)             LAYOUT="EN" ;;
esac

sketchybar --set "$NAME" label="$LAYOUT"
