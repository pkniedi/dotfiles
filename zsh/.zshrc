plugins=( 
httpie
git
zsh-autosuggestions
aliases
fancy-ctrl-z
sudo
copybuffer
copyfile
copypath
colored-man-pages
web-search
wd
cp
aliases
colorize
archlinux # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
zsh-syntax-highlighting
zsh-history-substring-search
dirhistory
zsh-vi-mode
tmux
)

# WARN: Source both before oh-my-zsh
source $ZDOTDIR/src.zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/prompts.zsh
# source ~/gitstatus/gitstatus.prompt.zsh
source $ZSH/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/aliases.zsh


# https://zsh.sourceforge.io/Intro/intro_16.html
# setopt GLOBDOTS

# HISTIGNOREDUPS prevents the current line from being saved in the history if it is the same as the previous one; HISTIGNORESPACE prevents the current line from being saved if it begins with a space.
setopt HISTIGNOREDUPS HISTIGNORESPACE
# NOCLOBBER prevents you from accidentally overwriting an existing file.
# setopt noclobber
setopt SUNKEYBOARDHACK
unsetopt HIST_VERIFY

tty | grep dev/pts &>/dev/null  && eval "$(starship init zsh)" || PROMPT="%2. $ "

