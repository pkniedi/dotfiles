#!/bin/bash

#  _                                               _
# | |_ _ __ ___  _   ___  __     ___  ___  ___ ___(_) ___  _ __  ___
# | __| '_ ` _ \| | | \ \/ /____/ __|/ _ \/ __/ __| |/ _ \| '_ \/ __|
# | |_| | | | | | |_| |>  <_____\__ \  __/\__ \__ \ | (_) | | | \__ \
#  \__|_| |_| |_|\__,_/_/\_\    |___/\___||___/___/_|\___/|_| |_|___/
#

# Create a new tmux session

SESSION="school"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION -c $HOME/notes/zettelkasten
        tmux rename-window -t $SESSION:0 'analysis II'
        tmux new-window -t $SESSION:1 -n 'numcs' -c $HOME/notes/zettelkasten
        tmux new-window -t $SESSION:2 -n 'spca' -c $HOME/notes/zettelkasten
        tmux new-window -t $SESSION:3 -n 'compiler-design' -c $HOME/notes/zettelkasten
else
        echo ":: Session $SESSION already exists"
fi


###########

SESSION="config"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION -c $HOME/.config/nvim/lua
        tmux rename-window -t $SESSION:0 'nvim'
        tmux new-window -t $SESSION:1 -n 'zsh' -c $HOME/.config/zshrc
        echo ":: Done"
else
        echo ":: Session $SESSION already exists"
fi

#####

SESSION="notes"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION -c $HOME/notes/zettelkasten
        tmux rename-window -t $SESSION:0 'notes'
        echo ":: Done"
else
        echo ":: Session $SESSION already exists"
fi


###########

# background jobs
SESSION="bgj"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION
        echo ":: Done"
else
        echo ":: Session $SESSION already exists"
fi
