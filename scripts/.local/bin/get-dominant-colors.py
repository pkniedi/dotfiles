#!/usr/bin/env zsh

import os
from colorthief import ColorThief


print("Getting dominant colors from images in /tmp/wallpaper",flush=True)
image_path = '/tmp/wallpaper'

print("Getting dominant colors from images in", image_path,flush=True)
images = [image for image in os.listdir(image_path)]  # assuming only images are in the path

dominant_colors = {}

for image in images:
    print("Processing", image,flush=True)
    color_thief = ColorThief(os.path.join(image_path, image))
    dominant_colors.update({(image, color_thief.get_color(quality=1))})

for image, dominant_color in dominant_colors.items():
    print(image, dominant_color)
