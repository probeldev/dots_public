#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Активное приложение + заголовок окна (спрашиваем у rift — там есть is_focused и title)
case "$SENDER" in
  front_app_switched|rift_window_title_changed|forced)
    LABEL=$(rift-cli query windows 2>/dev/null | python3 -c '
import json, sys
try:
    ws = json.load(sys.stdin)
except Exception:
    sys.exit(0)
f = next((w for w in ws if w.get("is_focused")), None)
if f:
    t = f.get("title") or ""
    if len(t) > 70:
        t = t[:67] + "..."
    print(f["app_name"] + "  —  " + t)
')
    # фолбэк: rift мог не вернуть окно (напр. чужой space) — показываем хотя бы имя приложения
    [ -z "$LABEL" ] && [ -n "$INFO" ] && LABEL="$INFO"
    [ -n "$LABEL" ] && sketchybar --set "$NAME" label="$LABEL"
    ;;
esac
