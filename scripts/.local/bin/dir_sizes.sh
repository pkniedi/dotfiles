#!/usr/bin/env zsh



for dir in $(ls -d $HOME/*); do
    du -sh $dir
done
