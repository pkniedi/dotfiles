#!/usr/bin/env zsh


news_urls=(
        "https://archlinux.org/packages/"
        "https://aur.archlinux.org/"
        "https://news.ycombinator.com/"
        "https://www.theguardian.com/europe"
        "https://stallman.org/"
        "https://slavoj.substack.com/"
        "https://github.com/login"
        "https://account.proton.me/mail"
)

for url in "$news_urls[@]"; do
        firefox --new-tab $url
        echo Open: $url
done

exit 0
if [ $# -lt 1 ]; then
        echo too few args
else
        if [[ $1 == "news" ]]; then
                for url in "$news_urls[@]"; do
                        firefox --new-tab $url
                done

        fi
fi
