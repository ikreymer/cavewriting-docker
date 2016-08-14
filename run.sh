#!/bin/sh

jwm -display $DISPLAY &

cd ~/cavewriting/bin/

run_browser ./cwappd desktopfullscreen $1
