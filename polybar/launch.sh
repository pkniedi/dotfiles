#!/usr/bin/env zsh

polybar-msg cmd quit
msleep 450
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bottom 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar top 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
