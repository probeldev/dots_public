#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
# Дочерний процесс `omniwmctl watch`: получает NDJSON-событие на stdin и
# превращает его в sketchybar-триггеры (аналог подписок rift).
# Канал приходит в переменной окружения OMNIWM_EVENT_CHANNEL.
cat >/dev/null 2>&1 || true

case "$OMNIWM_EVENT_CHANNEL" in
  focus)
    sketchybar --trigger omni_window_title_changed >/dev/null 2>&1
    ;;
  active-workspace)
    sketchybar --trigger omni_workspace_changed >/dev/null 2>&1
    ;;
  windows-changed|layout-changed)
    sketchybar --trigger omni_windows_changed >/dev/null 2>&1
    ;;
esac
exit 0
