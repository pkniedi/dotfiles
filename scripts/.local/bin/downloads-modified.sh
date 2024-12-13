#!/usr/bin/env zsh

dir=~/Downloads
time_limit=300  # 5 minutes in seconds

# Get the last modification time of the directory in seconds since epoch
last_modified=$(stat -c %Y "$dir")

# Get the current time in seconds since epoch
current_time=$(date +%s)

# Calculate the time difference
time_diff=$((current_time - last_modified))

# Check if the directory was modified in the last 5 minutes
if (( time_diff <= time_limit )); then
  exit 0
else
  exit 1
fi
