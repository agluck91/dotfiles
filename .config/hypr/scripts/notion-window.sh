#!/bin/bash
# Open a floating Notion window, or focus existing one if already open
# Usage: notion-window.sh [shortcut]
# shortcut: ctrl+alt+n or ctrl+alt+m

SHORTCUT="${1:-}"

FLOATING_COUNT=$(hyprctl clients -j | python3 -c "
import json, sys
clients = json.load(sys.stdin)
count = sum(1 for c in clients if c.get('class') == 'Notion' and c.get('floating'))
print(count)
")

if [ "$FLOATING_COUNT" -gt 0 ]; then
    hyprctl dispatch focuswindow "floating:1,class:^(Notion)$"
else
    notion-app --new-window &
fi
