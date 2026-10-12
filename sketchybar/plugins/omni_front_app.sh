#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Активное приложение + заголовок окна (спрашиваем у OmniWM через omniwmctl)
case "$SENDER" in
  front_app_switched|omni_window_title_changed|forced)
    LABEL=$(omniwmctl query focused-window --fields app,title 2>/dev/null | python3 -c '
import json, sys
try:
    d = json.load(sys.stdin)
except Exception:
    sys.exit(0)
p = d.get("result", d)
if isinstance(p, dict):
    p = p.get("payload", p)
app = p.get("app") or p.get("appName") or ""
t = p.get("title") or ""
if len(t) > 70:
    t = t[:67] + "..."
if app and t:
    print(app + "  —  " + t)
else:
    print(app or t)
')
    # фолбэк: OmniWM мог не вернуть окно (напр. чужой space) — показываем хотя бы имя приложения
    [ -z "$LABEL" ] && [ -n "$INFO" ] && LABEL="$INFO"
    [ -n "$LABEL" ] && sketchybar --set "$NAME" label="$LABEL"
    ;;
esac
