alias zf=zaf
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias fnv='nv `fzf`'
alias copypath="pwd | tr -d '\n' | xclip -i -selection clipboard"
alias d='dirs -v'
alias md='mkdir -p'
alias rmzip='rm -r *.zip'
alias ls='ls --color'
alias la='ls -lah'
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
alias jc='javac'
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
# alias vlc="vlc --rate=1.35 &>/dev/null"
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
alias fan='sensors | grep fan | cut -d : -f2 | sed s/\ //g'
alias time=/usr/bin/time


# ------------------------------------------------------------------------------
# Description
# -----------
#
# This is one for the system administrator, operation and maintenance.
#
# ------------------------------------------------------------------------------

function retlog() {
  if [[ -z $1 ]];then
    echo '/var/log/nginx/access.log'
  else
    echo $1
  fi
}

alias ping='ping -c 5'
alias clr='clear; echo Currently logged in on $TTY, as $USERNAME in directory $PWD.'
alias path='print -l $path'
alias mkdir='mkdir -pv'
# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1 -nr'
alias psmem10='ps -e -orss=,args= | sort -b -k1 -nr | head -n 10'
# get top process eating cpu if not work try execute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr | head -n 10'
# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

function ip() {
  if [ -t 1 ]; then
    command ip -color "$@"
  else
    command ip "$@"
  fi
}

# directory LS
function dls() {
  print -l *(/)
}
function psgrep() {
  ps aux | grep "${1:-.}" | grep -v grep
}
# Kills any process that matches a regexp passed to it
function killit() {
  ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# list contents of directories in a tree-like format
if ! (( $+commands[tree] )); then
  function tree() {
    find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  }
fi

# Sort connection state
function sortcons() {
  {
    LANG= ss -nat | awk 'NR > 1 {print $1}' \
    || LANG= netstat -nat | awk 'NR > 2 {print $6}'
  } | sort | uniq -c | sort -rn
}

# View all 80 Port Connections
function con80() {
  {
    LANG= ss -nat || LANG= netstat -nat
  } | grep -E ":80[^0-9]" | wc -l
}

# On the connected IP sorted by the number of connections
function sortconip() {
  {
    LANG= ss -ntu | awk 'NR > 1 {print $6}' \
    || LANG= netstat -ntu | awk 'NR > 2 {print $5}'
  } | cut -d: -f1 | sort | uniq -c | sort -n
}

# top20 of Find the number of requests on 80 port
function req20() {
  {
    LANG= ss -tn | awk '$4 ~ /:80$/ {print $5}' \
    || LANG= netstat -tn | awk '$4 ~ /:80$/ {print $5}'
  } | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -n 20
}

# top20 of Using tcpdump port 80 access to view
function http20() {
  sudo tcpdump -i eth0 -tnn dst port 80 -c 1000 | awk -F"." '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -nr | head -n 20
}

# top20 of Find time_wait connection
function timewait20() {
  {
    LANG= ss -nat | awk 'NR > 1 && /TIME-WAIT/ {print $5}' \
    || LANG= netstat -nat | awk 'NR > 2 && /TIME_WAIT/ {print $5}'
  } | sort | uniq -c | sort -rn | head -n 20
}

# top20 of Find SYN connection
function syn20() {
  {
    LANG= ss -an | awk '/SYN/ {print $5}' \
    || LANG= netstat -an | awk '/SYN/ {print $5}'
  } | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -n20
}

# Printing process according to the port number
function port_pro() {
  LANG= ss -ntlp | awk "NR > 1 && /:${1:-}/ {print \$6}" | sed 's/.*pid=\([^,]*\).*/\1/' \
  || LANG= netstat -ntlp | awk "NR > 2 && /:${1:-}/ {print \$7}" | cut -d/ -f1
}

# top10 of gain access to the ip address
function accessip10() {
  awk '{counts[$(11)]+=1}; END {for(url in counts) print counts[url], url}' "$(retlog)"
}

# top20 of Most Visited file or page
function visitpage20() {
  awk '{print $11}' "$(retlog)" | sort | uniq -c | sort -nr | head -n 20
}

# top100 of Page lists the most time-consuming (more than 60 seconds) as well as the corresponding page number of occurrences
function consume100() {
  awk '($NF > 60 && $7~/\.php/){print $7}' "$(retlog)" | sort -n | uniq -c | sort -nr | head -n 100
  # if django website or other website make by no suffix language
  # awk '{print $7}' "$(retlog)" | sort -n | uniq -c | sort -nr | head -n 100
}

# Website traffic statistics (G)
function webtraffic() {
  awk "{sum+=$10} END {print sum/1024/1024/1024}" "$(retlog)"
}

# Statistical connections 404
function c404() {
  awk '($9 ~ /404/)' "$(retlog)" | awk '{print $9,$7}' | sort
}

# Statistical http status.
function httpstatus() {
  awk '{counts[$(9)]+=1}; END {for(code in counts) print code, counts[code]}' "$(retlog)"
}

# Delete 0 byte file
function d0() {
  find "${1:-.}" -type f -size 0 -exec rm -rf {} \;
}

# gather external ip address
function geteip() {
  curl -s -S -4 https://icanhazip.com

  # handle case when there is no IPv6 external IP, which shows error
  # curl: (7) Couldn't connect to server
  curl -s -S -6 https://icanhazip.com 2>/dev/null
  local ret=$?
  (( ret == 7 )) && print -P -u2 "%F{red}error: no IPv6 route to host%f"
  return $ret
}

# determine local IP address(es)
function getip() {
  if (( ${+commands[ip]} )); then
    ip addr | awk '/inet /{print $2}' | command grep -v 127.0.0.1
  else
    ifconfig | awk '/inet /{print $2}' | command grep -v 127.0.0.1
  fi
}

# Clear zombie processes
function clrz() {
  ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
}

# Second concurrent
function conssec() {
  awk '{if($9~/200|30|404/)COUNT[$4]++}END{for( a in COUNT) print a,COUNT[a]}' "$(retlog)" | sort -k 2 -nr | head -n10
}


# git

# Aliases
# (sorted alphabetically by command)
# (order should follow README)
# (in some cases force the alisas order to match README, like for example gke and gk)
#

alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'


alias ggpur='ggu'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gamscp='git am --show-current-patch'
alias gams='git am --skip'
alias gap='git apply'
alias gapt='git apply --3way'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gbl='git blame -w'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'

function gbda() {
  git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch --delete 2>/dev/null
}

# Copied and modified from James Roeder (jmaroeder) under MIT License
# https://github.com/jmaroeder/plugin-git/blob/216723ef4f9e8dde399661c39c80bdf73f4076c4/functions/gbda.fish
function gbds() {
  local default_branch=$(git_main_branch)
  (( ! $? )) || default_branch=$(git_develop_branch)

  git for-each-ref refs/heads/ "--format=%(refname:short)" | \
    while read branch; do
      local merge_base=$(git merge-base $default_branch $branch)
      if [[ $(git cherry $default_branch $(git commit-tree $(git rev-parse $branch\^{tree}) -p $merge_base -m _)) = -* ]]; then
        git branch -D $branch
      fi
    done
}

alias gbgd='LANG=C git branch --no-color -vv | grep ": gone\]" | awk '"'"'{print $1}'"'"' | xargs git branch -d'
alias gbgD='LANG=C git branch --no-color -vv | grep ": gone\]" | awk '"'"'{print $1}'"'"' | xargs git branch -D'
alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbg='LANG=C git branch -vv | grep ": gone\]"'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gclean='git clean --interactive -d'
alias gcl='git clone --recurse-submodules'

alias gcam='git commit --all --message'
alias gcas='git commit --all --signoff'
alias gcasm='git commit --all --signoff --message'
alias gcs='git commit --gpg-sign'
alias gcss='git commit --gpg-sign --signoff'
alias gcssm='git commit --gpg-sign --signoff --message'
alias gcmsg='git commit --message'
alias gcsm='git commit --signoff --message'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gcans!='git commit --verbose --all --signoff --no-edit --amend'
alias gcann!='git commit --verbose --all --date=now --no-edit --amend'
alias gc!='git commit --verbose --amend'
alias gcn!='git commit --verbose --no-edit --amend'
alias gcf='git config --list'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'


alias gdup='git diff @{upstream}'


alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gf='git fetch'
# --jobs=<n> was added in git 2.8
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ghh='git help'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}

alias glp='_git_log_prettily'
alias glg='git log --stat'
alias glgp='git log --stat --patch'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gfg='git ls-files | grep'
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gms="git merge --squash"
alias gmom='git merge origin/$(git_main_branch)'
alias gmum='git merge upstream/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'

alias gl='git pull'
alias gpr='git pull --rebase'
alias gprv='git pull --rebase -v'
alias gpra='git pull --rebase --autostash'
alias gprav='git pull --rebase --autostash -v'

function ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}

alias gprom='git pull --rebase origin $(git_main_branch)'
alias gpromi='git pull --rebase=interactive origin $(git_main_branch)'
alias ggpull='git pull origin "$(git_current_branch)"'

function ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}

alias gluc='git pull upstream $(git_current_branch)'
alias glum='git pull upstream $(git_main_branch)'
alias gp='git push'
alias gpd='git push --dry-run'


alias gpf!='git push --force'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpv='git push --verbose'
alias gpoat='git push origin --all && git push origin --tags'
alias gpod='git push origin --delete'
alias ggpush='git push origin "$(git_current_branch)"'
alias gpu='git push upstream'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'
alias grf='git reflog'
alias gr='git remote'
alias grv='git remote --verbose'
alias gra='git remote add'
alias grrm='git remote remove'
alias grmv='git remote rename'
alias grset='git remote set-url'
alias grup='git remote update'
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias gpristine='git reset --hard && git clean --force -dfx'
alias gwipe='git reset --hard && git clean --force -df'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
alias grev='git revert'
alias greva='git revert --abort'
alias grevc='git revert --continue'
alias grm='git rm'
alias grmc='git rm --cached'
alias gcount='git shortlog --summary --numbered'
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'
alias gstall='git stash --all'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --patch'
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsd='git svn dcommit'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gsr='git svn rebase'
alias gsw='git switch'
alias gswc='git switch --create'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gta='git tag --annotate'
alias gts='git tag --sign'
alias gtv='git tag | sort -V'
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'
alias gstu='gsta --include-untracked'
alias gtl='gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'
alias gk='\gitk --all --branches &!'
alias gke='\gitk --all $(git log --walk-reflogs --pretty=%h) &!'
alias nf='nv $(fzf)'


alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias paclean='sudo pacman -Sc'
alias pacins='sudo pacman -U'
alias paclr='sudo pacman -Scc'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="sudo pacman -Sy"

if (( $+commands[yay] )); then
  alias yaconf='yay -Pg'
  alias yaclean='yay -Sc'
  alias yaclr='yay -Scc'
  alias yaupg='yay -Syu'
  alias yasu='yay -Syu --noconfirm'
  alias yain='yay -S'
  alias yains='yay -U'
  alias yare='yay -R'
  alias yarem='yay -Rns'
  alias yarep='yay -Si'
  alias yareps='yay -Ss'
  alias yaloc='yay -Qi'
  alias yalocs='yay -Qs'
  alias yalst='yay -Qe'
  alias yaorph='yay -Qtd'
  alias yainsd='yay -S --asdeps'
  alias yamir='yay -Syy'
  alias yaupd="yay -Sy"
fi

function upgrade() {
  echo ":: Checking Arch Linux PGP Keyring..."
  local installedver="$(LANG= sudo pacman -Qi archlinux-keyring | grep -Po '(?<=Version         : ).*')"
  local currentver="$(LANG= sudo pacman -Si archlinux-keyring | grep -Po '(?<=Version         : ).*')"
  if [ $installedver != $currentver ]; then
    echo " Arch Linux PGP Keyring is out of date."
    echo " Updating before full system upgrade."
    sudo pacman -Sy --needed --noconfirm archlinux-keyring
  else
    echo " Arch Linux PGP Keyring is up to date."
    echo " Proceeding with full system upgrade."
  fi
  if (( $+commands[yay] )); then
    yay -Syu
  elif (( $+commands[trizen] )); then
    trizen -Syu
  elif (( $+commands[pacaur] )); then
    pacaur -Syu
  elif (( $+commands[aura] )); then
    sudo aura -Syu
  else
    sudo pacman -Syu
  fi
}


function paclist() {
  pacman -Qqe | xargs -I{} -P0 --no-run-if-empty pacman -Qs --color=auto "^{}\$"

}

unset git_version

# Logic for adding warnings on deprecated aliases
local old_alias new_alias
for old_alias new_alias (
  # TODO(2023-10-19): remove deprecated `git pull --rebase` aliases
  gup     gpr
  gupv    gprv
  gupa    gpra
  gupav   gprav
  gupom   gprom
  gupomi  gpromi
); do
  aliases[$old_alias]="
    print -Pu2 \"%F{yellow}[oh-my-zsh] '%F{red}${old_alias}%F{yellow}' is a deprecated alias, using '%F{green}${new_alias}%F{yellow}' instead.%f\"
    $new_alias"
done
unset old_alias new_alias
