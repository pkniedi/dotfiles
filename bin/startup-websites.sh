#!/usr/bin/env zsh


news_urls=(
        "https://archlinux.org/packages/"
        "https://aur.archlinux.org/"
        "https://www.theguardian.com/europe"
        "https://www.theguardian.com/us-news"
        "https://www.theguardian.com/international"
        "https://news.ycombinator.com/"
        "https://stallman.org/"
        "https://substack.com/sign-in?"
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
