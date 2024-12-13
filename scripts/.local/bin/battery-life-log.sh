#!/bin/sh

STFILE=~/.cache/battery-life-log # File with the status
CDATE=$(date +%d-%m-%y) # Current date
BCAPAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "capacity:" | awk '{print $2}') # Current battery percentage
grep -qs "$CDATE" "$STFILE" || echo "$CDATE" - "$BCAPAT" >> "$STFILE"
