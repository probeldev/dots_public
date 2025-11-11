#!/bin/bash

SPACES_JSON=$(aerospace list-workspaces --all --json 2>/dev/null)
CURRENT_SPACE_JSON=$(aerospace list-workspaces --focused --json 2>/dev/null)

# Исправляем парсинг - берем первый элемент массива
SPACES=$(echo "$SPACES_JSON" | jq -r '.[] | .workspace' 2>/dev/null)
CURRENT_SPACE=$(echo "$CURRENT_SPACE_JSON" | jq -r '.[0].workspace // empty' 2>/dev/null)

# Create space labels with current workspace in brackets
SPACE_LABELS=""
for SPACE in $SPACES; do
    if [ "$SPACE" = "$CURRENT_SPACE" ]; then
        SPACE_LABELS+=" [$SPACE] "
    else
        SPACE_LABELS+=" $SPACE "
    fi
done

sketchybar -m --set spaces label="$SPACE_LABELS"
