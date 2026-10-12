#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Обновляет индикатор воркспейса OmniWM по его номеру (имя айтема omni_ws.N,
# где N — ноль-базовый индекс панели, номер воркспейса = N+1):
# активный — синяя пилюля, занятый — яркая цифра, пустой — приглушённая.
INDEX="${NAME##*.}"
WS_NUMBER=$((INDEX + 1))

STATE=$(omniwmctl query workspaces 2>/dev/null | python3 -c "
import json, sys
try:
    d = json.load(sys.stdin)
except Exception:
    sys.exit(0)
p = d.get('result', d)
if isinstance(p, dict):
    p = p.get('payload', p)
items = p.get('workspaces', p) if isinstance(p, dict) else p
if not isinstance(items, list):
    sys.exit(0)
w = None
for x in items:
    num = x.get('number', x.get('rawName', x.get('name')))
    if str(num) == '$WS_NUMBER':
        w = x
        break
if w is None:
    print('missing 0')
else:
    active = 1 if (w.get('isCurrent') or w.get('isFocused')) else 0
    c = w.get('counts')
    if isinstance(c, dict):
        n = c.get('total', c.get('windows', 0)) or 0
    elif isinstance(c, int):
        n = c
    else:
        n = w.get('windowCount', 0) or 0
    print(active, n)
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
