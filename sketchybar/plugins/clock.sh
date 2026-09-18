#!/bin/bash
export PATH="/run/current-system/sw/bin:$PATH"
sketchybar --set "$NAME" label="$(date '+%a %d %b  %H:%M')"
