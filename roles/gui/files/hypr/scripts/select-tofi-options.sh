#!/usr/bin/env bash

# ███████╗███████╗██╗     ███████╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗      ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
# ██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║      ████╗ ████║██╔════╝████╗  ██║██║   ██║
# ███████╗█████╗  ██║     █████╗  ██║        ██║   ██║██║   ██║██╔██╗ ██║█████╗██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
# ╚════██║██╔══╝  ██║     ██╔══╝  ██║        ██║   ██║██║   ██║██║╚██╗██║╚════╝██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
# ███████║███████╗███████╗███████╗╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║      ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
# ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝      ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
#



HELPERFILES=~/.config/hypr/helpers
TMPFILE=/tmp/tofi-helper-temp-selection

cat $HELPERFILES/options.txt | tofi --require-match false  > $TMPFILE


# Available options:
# Nerd-fonts cheatsheet
# Umlaute
# Chatbot Prompts
# Clipboard history
# System

# Not implemented/further ideas
# Actions

SELECTION=$(cat $TMPFILE)

# Use LRU as top option
sed -i "/$SELECTION/d" $HELPERFILES/options.txt
sed -i "1s/^/$SELECTION\n/" $HELPERFILES/options.txt

case $SELECTION in
        "Actions")
                cat $HELPERFILES/actions.txt | tofi --require-match false  | wl-copy
                ;;
        "Nerd-fonts cheatsheet")
                cat $HELPERFILES/nerd-font-cheatsheet.txt | tofi --require-match false   | cut -d ' ' -f2 | wl-copy
                ;;
        "Umlaute")
                # Change to keyboard switcher
                cat $HELPERFILES/umlaute.txt | tofi --require-match false  | wl-copy
                ;;
        "Chatbot Prompts")
                jq -r "keys[]" $HELPERFILES/chatbot-prompts.json | tofi > $TMPFILE || exit 1
                KEY=$(cat $TMPFILE)
                CHATBOT_PROMPT=$(jq ".\"$KEY\"" $HELPERFILES/chatbot-prompts.json)
                echo "" | tofi --prompt-text="Input concept: " --require-match=false > $TMPFILE
                echo $CHATBOT_PROMPT | sed -e "s/<<CONCEPT>>/$(cat $TMPFILE)/g" | wl-copy
                ;;
        "Clipboard history")
                cliphist list | tofi | cliphist decode | wl-copy
                ;;
        "Shutdown")
                re
                systemctl poweroff
                ;;
        "Reboot")
                systemctl reboot
                ;;
        "Suspend")
                systemctl suspend
                ;;
        "Lock")
                hyprlock
                ;;
        "Logout")
                hyprctl dispatch logout
                ;;
        "Urls")
                # notify-send "Select urls"
                firefox $(cat $HELPERFILES/urls | tofi --require-match false |  cut -d '	' -f2)
                ;;

        *)
                # Won't happen
                notify-send "No valid option selected"
                ;;
esac
