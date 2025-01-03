#!/usr/bin/env zsh

omz_urlencode () {
        zmodload zsh/langinfo
	emulate -L zsh
	setopt norematchpcre
	local -a opts
	zparseopts -D -E -a opts r m P
	local in_str="$@"
	local url_str=""
	local spaces_as_plus
	if [[ -z $opts[(r)-P] ]]
	then
		spaces_as_plus=1
	fi
	local str="$in_str"
	local encoding=$langinfo[CODESET]
	local safe_encodings
	safe_encodings=(UTF-8 utf8 US-ASCII)
	if [[ -z ${safe_encodings[(r)$encoding]} ]]
	then
		str=$(echo -E "$str" | iconv -f $encoding -t UTF-8)
		if [[ $? != 0 ]]
		then
			echo "Error converting string from $encoding to UTF-8" >&2
			return 1
		fi
	fi
	local i byte ord LC_ALL=C
	export LC_ALL
	local reserved=';/?:@&=+$,'
	local mark='_.!~*''()-'
	local dont_escape="[A-Za-z0-9"
	if [[ -z $opts[(r)-r] ]]
	then
		dont_escape+=$reserved
	fi
	if [[ -z $opts[(r)-m] ]]
	then
		dont_escape+=$mark
	fi
	dont_escape+="]"
	local url_str=""
	for ((i = 1; i <= ${#str}; ++i )) do
		byte="$str[i]"
		if [[ "$byte" =~ "$dont_escape" ]]
		then
			url_str+="$byte"
		else
			if [[ "$byte" == " " && -n $spaces_as_plus ]]
			then
				url_str+="+"
			elif [[ "$PREFIX" = *com.termux* ]]
			then
				url_str+="$byte"
			else
				ord=$(( [##16] #byte ))
				url_str+="%$ord"
			fi
		fi
	done
	echo -E "$url_str"
}
open_command () {
	local open_cmd
	case "$OSTYPE" in
		(darwin*) open_cmd='open'  ;;
		(cygwin*) open_cmd='cygstart'  ;;
		(linux*) [[ "$(uname -r)" != *icrosoft* ]] && open_cmd='nohup xdg-open'  || {
				open_cmd='cmd.exe /c start ""'
				[[ -e "$1" ]] && {
					1="$(wslpath -w "${1:a}")"  || return 1
				}
			} ;;
		(msys*) open_cmd='start ""'  ;;
		(*) echo "Platform $OSTYPE not supported"
			return 1 ;;
	esac
	if [[ -n "$BROWSER" && "$1" = (http|https)://* ]]
	then
		"$BROWSER" "$@"
		return
	fi
	${=open_cmd} "$@" &> /dev/null
}

web_search () {
	emulate -L zsh
	typeset -A urls
	urls=($ZSH_WEB_SEARCH_ENGINES google "https://www.google.com/search?q=" bing "https://www.bing.com/search?q=" brave "https://search.brave.com/search?q=" yahoo "https://search.yahoo.com/search?p=" duckduckgo "https://www.duckduckgo.com/?q=" startpage "https://www.startpage.com/do/search?q=" yandex "https://yandex.ru/yandsearch?text=" github "https://github.com/search?q=" baidu "https://www.baidu.com/s?wd=" ecosia "https://www.ecosia.org/search?q=" goodreads "https://www.goodreads.com/search?q=" qwant "https://www.qwant.com/?q=" givero "https://www.givero.com/search?q=" stackoverflow "https://stackoverflow.com/search?q=" wolframalpha "https://www.wolframalpha.com/input/?i=" archive "https://web.archive.org/web/*/" scholar "https://scholar.google.com/scholar?q=" ask "https://www.ask.com/web?q=" youtube "https://www.youtube.com/results?search_query=" deepl "https://www.deepl.com/translator#auto/auto/" dockerhub "https://hub.docker.com/search?q=" npmpkg "https://www.npmjs.com/search?q=" packagist "https://packagist.org/?query=" gopkg "https://pkg.go.dev/search?m=package&q=" chatgpt "https://chatgpt.com/?q=" reddit "https://www.reddit.com/search/?q=")
	if [[ -z "$urls[$1]" ]]
	then
		echo "Search engine '$1' not supported."
		return 1
	fi
	if [[ $# -gt 1 ]]
	then
		local param="-P"
		[[ "$urls[$1]" == *\?*= ]] && param=""
		url="${urls[$1]}$(omz_urlencode $param ${(s: :)@[2,-1]})"
	else
		url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
	fi
	open_command "$url"
}

web_search duckduckgo $(wl-paste)
