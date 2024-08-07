which exa &>/dev/null && alias la='exa --icons -F -H --group-directories-first --sort=mod --git -1 -lah' || alias la='ls -lah'
alias rmzip='rm -r *.zip'
alias rmr='rm -r'
alias pdw='pwd'
alias manp='man-preview'
alias ddgr='ddgr -n 5'
alias ralias='alias | fzf'
alias mode='zsh ~/.zsh-scripts/Launcher.zsh;'
alias ee='exec zsh'
alias nodedocs='open https://nodejs.org/docs/latest-v19.x/api/'
alias jsdocs='open https://developer.mozilla.org/en-US/'
alias rmgit='rm -rf .git'
alias nin='node index.js'
alias todos='node /Users/jaron/Workspaces/Coding/todoApp/index.js'
alias cl='clear'
alias nv='nvim'
alias bt='blueutil -p'
alias py='python3'
alias zat='zathura -P 0 &>/dev/null'
alias q='exit'
which toilet &>/dev/null && alias hellothere='toilet -f fonts/slant "General Kenobi"' || alias hellothere='echo "General Kenobi"'
alias mvdes='mv ~/Desktop/* .'
alias yrs='yabai --restart-service'
alias passget='cat ~/Documents/lister/passphrase.txt | pbcopy'
alias texc='latexmk -pdf -synctex=1 -output-directory=../output'
alias nvconf='wd nvim;nv'
alias conzsh='nv ~/.config/zsh/.zshrc'
alias addsnip='cd ~/.config/nvim/Ultisnips; nv'
alias lt='latexmk -pdf -outdir=output -pvc --shell-escape'
alias lts='latexmk -pdf -silent -outdir=output -pvc '
alias echopath="echo '\$PATH: \n'; sed 's/:/  \n  /g' <<<$PATH"
alias annihilate="rm -rf"
alias jc='javac'
alias jcrm='javac Main.java; java Main'
alias dirs='dirs -v'
alias pd='pushd -q'
alias gd='popd -q'
alias addlink='nv ~/Documents/Links/links'
alias pac='sudo pacman -S'
alias con="nv -c /stopped"
alias ldprompt="source ~/.config/zsh/prompts.sh"
alias pasta="/home/jaron/resources/mathematics/real-analysis"
alias cnvim="nvim /home/jaron/.config/nvim/"
alias gccsqlite="gcc -lsqlite3 -std=c99"
alias vid="vlc &> /dev/null"
alias bckupdir="mkdir -p $(date +\"%d-%m\")-backup"
alias today="date +%d-%m"
alias src="source $HOME/.config/zsh/src.zsh"
alias vlc="vlc --rate=1.35 &>/dev/null"
alias texsym="zat $HOME/resources/references/symbols-a4.pdf &"
alias python=/usr/bin/python3
alias py=/usr/bin/python3
alias nt="notes t"
alias nf="notes f"
alias nr="notes r"
alias ne="notes e"
alias tls="tmux ls"
alias tks="tmux kill-server"
alias tnwn="tmux new-window -n"
alias tnw="tmux new-window"
alias tns="tmux new -s"
alias td="tmux detach"
alias o="xdg-open"
alias ltm="latexmk -pdf -outdir=output -pvc main.tex"
alias hfzf="history | fzf"
alias ll='linky'
alias conread='zathura &>/dev/null ~/resources/curr_book'
alias lc='wc -l'
