#!/usr/bin/env zsh

TIMEZONES=("America/New_York" "Asia/Hong_Kong")

while true; do
        TZ="America/New_York" date
        sleep 1
        clear
done
