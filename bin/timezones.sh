#!/usr/bin/env zsh

TIMEZONES=("America/New_York" "Asia/Hong_Kong" "Asia/Tokyo" "America/Los_Angeles")


while true; do
        for i in "$TIMEZONES[@]"; do
                NAME=$(printf $i | cut -d '/' -f 2 | tr '_' ' ')
                printf "$NAME: "; TZ=$i date +%H:%M
                sleep 20
        done
done

