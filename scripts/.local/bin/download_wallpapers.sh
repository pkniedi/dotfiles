#!/usr/bin/env zsh

#                _ _
# __      ____ _| | |_ __   __ _ _ __   ___ _ __ ___
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__/ __|
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |  \__ \
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|  |___/
#                   |_|         |_|
#
urls=(
https://pin.it/6FmAB5HEM
)
wallpaper_dir=$HOME/wallpaper
if [ ! -d $wallpaper_dir ]; then
    mkdir -p $wallpaper_dir
fi

for url in $urls; do
       wget -O $wallpaper_dir/$(basename $url) $url
done
