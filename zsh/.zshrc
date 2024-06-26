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
archlinux
zsh-syntax-highlighting
zsh-history-substring-search
dirhistory
zsh-vi-mode
)

# WARN: All before sourcing oh-my-zsh

source $ZDOTDIR/src.zsh
export ZSH_COMPDUMP=$ZSH_HOME/cache/.zcompdump-$HOST
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
which fzf &>/dev/null && source /usr/share/fzf/key-bindings.zsh
which fzf &>/dev/null && source /usr/share/fzf/completion.zsh
source $ZDOTDIR/colors.zsh
source $ZDOTDIR/prompt.zsh
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/aliases.zsh

setopt HISTIGNOREDUPS HISTIGNORESPACE
setopt SUNKEYBOARDHACK
unsetopt HIST_VERIFY
