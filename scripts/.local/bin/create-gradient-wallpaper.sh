#!/usr/bin/env zsh


image=~/wallpapers/greenish-old-japanese-village.jpg

magick $image -resize 100x100 -colors 5 -format %c histogram:info:- | sort -n -k 1 | head -n 5  | cut -d : -f2 | cut -d ' ' -f3 | tr ' ' '-'
