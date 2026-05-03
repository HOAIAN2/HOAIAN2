#!/bin/bash

# --- THE "FOCUS FIXER" FOR ALACRITTY ---
# Cinnamon (Muffin) has this weird bug where it won't focus Alacritty windows on launch.
# It’s basically a fight between the 'winit' library and the window manager(muffin).
# This script is the peace treaty until someone fixes the upstream bug.

alacritty &
ALAC_PID=$!

sleep 0.0

for i in {1..100}; do
    WINDOW_ID=$(wmctrl -lp | awk -v pid="$ALAC_PID" '$3 == pid {print $1}')

    if [ -z "$WINDOW_ID" ]; then
        WINDOW_ID=$(wmctrl -l | grep "Alacritty" | tail -1 | awk '{print $1}')
    fi

    if [ -n "$WINDOW_ID" ]; then
        wmctrl -i -R "$WINDOW_ID" 
        break
    fi
    sleep 0.05
done
