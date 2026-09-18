#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Обновляет индикатор воркспейса rift по его индексу (из имени айтема rift_ws.N):
# активный — синяя пилюля, занятый — яркая цифра, пустой — приглушённая.
INDEX="${NAME##*.}"

STATE=$(rift-cli query workspaces 2>/dev/null | python3 -c "
import json, sys
try:
    ws = json.load(sys.stdin)
except Exception:
    sys.exit(0)
w = next((x for x in ws if x['index'] == $INDEX), None)
if w is None:
    print('missing 0')
else:
    print(int(w['is_active']), w['window_count'])
")

read -r IS_ACTIVE WINDOW_COUNT <<<"$STATE"

if [ "$IS_ACTIVE" = "1" ]; then
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xff89b4fa \
    icon.color=0xff11111b
elif [ "$WINDOW_COUNT" -gt 0 ] 2>/dev/null; then
  sketchybar --set "$NAME" \
    background.drawing=off \
    icon.color=0xffcdd6f4
else
  sketchybar --set "$NAME" \
    background.drawing=off \
    icon.color=0xff6c7086
fi
