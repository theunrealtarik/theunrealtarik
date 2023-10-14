#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the preview bar
polybar -r top -c "$DIR"/preview.ini &
polybar -r mid -c "$DIR"/preview.ini &
polybar -r bottom -c "$DIR"/preview.ini &
