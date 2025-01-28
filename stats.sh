#!/usr/bin/env zsh

printf "Stats---------------\n\n"

NR_OF_FILE=$(find . -type f | wc -l)
printf "  $NR_OF_FILE files\n"
NR_OF_DIRS=$(find . -type d | wc -l)
printf "  $NR_OF_DIRS directories\n"
FILE_SPACE_USAGE=$(du -sh . | cut -f1)
printf "󰋊  Estimated file space usage: $FILE_SPACE_USAGE\n"
