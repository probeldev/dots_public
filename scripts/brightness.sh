#!/bin/bash

# Установите: sudo apt install brightnessctl

CAM_DEVICE="/dev/video0"

get_cam_brightness() {
    ffmpeg -y -f v4l2 -video_size 320x240 -i "$CAM_DEVICE" \
           -vframes 1 -q:v 1 /tmp/frame.jpg 2>/dev/null
    
    brightness=$(convert /tmp/frame.jpg -colorspace Gray \
                 -format "%[mean]" info: 2>/dev/null 2>/dev/null)
    
    rm -f /tmp/frame.jpg
    echo $(echo "scale=2; $brightness / 655.35" | bc -l)
}

main() {
    local cam_value=$(get_cam_brightness)
    local screen_value=$(echo "scale=0; 5 + ($cam_value * 95 / 100)" | bc -l)
    
    if [ "$screen_value" -lt 5 ]; then
        screen_value=5
    elif [ "$screen_value" -gt 100 ]; then
        screen_value=100
    fi

    echo "Устанавливаем яркость: ${screen_value}%"
    brightnessctl set "${screen_value}%"
}

main
