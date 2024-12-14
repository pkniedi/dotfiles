#!/usr/bin/env zsh


if [ $# -ne 1 ]; then
    echo "Usage: $0 <output_dir>"
    exit 1
fi
cat /dev/null > all.txt
for font in $(ls | grep flf);do
        echo "----------------------" >> all.txt
        echo $font >> all.txt
        figlet -f ./$font $1 >> all.txt
        echo "\n\n\n" >> all.txt
done
