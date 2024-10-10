#!/usr/bin/env bash


if ping -c 1 8.8.8.8 &> /dev/null; then
    # Replace with your script
    echo "LOG SUCC $(date)" >> ~/logs/internet_check.log
fi
