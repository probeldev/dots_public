#!/bin/bash

MODE="$1"
OUTPUT="DP-2"  # Замените на нужный вывод (`niri msg outputs`)
USERNAME=$(whoami)  # Текущий пользователь
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $USERNAME)/bus"

case "$MODE" in
    "game")
        echo "🔄 Switching to GAME MODE (max performance, cron enabled)"
        # Очищаем crontab и добавляем задачи (от root)
        sudo bash -c "crontab -r 2>/dev/null || true"
        sudo bash -c "(
            echo \"*/1 * * * * echo level 7 > /proc/acpi/ibm/fan\"
            echo \"*/1 * * * * cpupower frequency-set -u 4500MHz\"
        ) | crontab -"
        # Применяем настройки сразу
        echo level 7 | sudo tee /proc/acpi/ibm/fan >/dev/null
        sudo cpupower frequency-set -u 4500MHz
        # Запускаем niri от пользователя (без sudo!)
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus" \
        niri msg output "$OUTPUT" scale 2
        ;;
    "work")
        echo "🔄 Switching to WORK MODE (quiet mode, cron enabled)"
        # Очищаем crontab и добавляем задачи (от root)
        sudo bash -c "crontab -r 2>/dev/null || true"
        sudo bash -c "(
            echo \"*/1 * * * * echo level 0 > /proc/acpi/ibm/fan\"
            echo \"*/1 * * * * cpupower frequency-set -u 1500MHz\"
        ) | crontab -"
        # Применяем настройки сразу
        echo level 0 | sudo tee /proc/acpi/ibm/fan >/dev/null
        sudo cpupower frequency-set -u 1500MHz
        # Запускаем niri от пользователя
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus" \
        niri msg output "$OUTPUT" scale 2.15
        ;;
    *)
        echo "Usage: $0 [game|work]"
        echo "  game - max performance (fan 7, CPU 4500MHz, scale 2)"
        echo "  work - quiet mode (fan 0, CPU 1500MHz, scale 2.15)"
        exit 1
        ;;
esac

echo "✅ Done! Current crontab:"
sudo crontab -l
