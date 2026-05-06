#!/usr/bin/env bash

# --- THE "FOCUS FIXER" FOR ALACRITTY ---
# Cinnamon (Muffin) has this weird bug where it won't focus Alacritty windows on launch.
# It’s basically a fight between the 'winit' library and the window manager(muffin).
# This script is the peace treaty until someone fixes the upstream bug.

alacritty &
ALAC_PID=$!

# Wait until a visible window for this PID exists
WINDOW_ID=$(xdotool search --sync --pid "$ALAC_PID" | head -n 1)

# sleep 0.0

wmctrl -i -R "$WINDOW_ID"
