source $ZDOTDIR/wd-main.zsh
source $ZDOTDIR/functions.sh
source $ZDOTDIR/aliases.sh
source $ZDOTDIR/cd-interactive.zsh
source $ZDOTDIR/keys.zsh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt EXTENDED_HISTORY

# PROMPT="%F{red}%n@%m%f:%F{blue}%2.%f %F{yellow}$%f "
PROMPT="%n@%m:%2. $ "
RPROMPT="%1(j.%j.)"

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Needed for compiler design class
#
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/jaron/.opam/opam-init/init.zsh' ]] || source '/home/jaron/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
