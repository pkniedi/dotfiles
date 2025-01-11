#!/usr/bin/env zsh


# Assumes that urls are valid

if [ $# -ne 1 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

if [ -f $1 ]; then

        for url in $(cat $1); do

                input=$(gum input --placeholder "Filename")
                gum confirm "Downloading as $input.mp4?" && wget -O $input.mp4 $url
        done
else
        echo "File not found"
        exit 1
fi
