#!/bin/bash


# Create a new tmux session

SESSION="school"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION -c $HOME/notes/zettelkasten
        tmux rename-window -t $SESSION:0 'tcs'
        tmux new-window -t $SESSION:1 -n 'analysis II' -c $HOME/notes/zettelkasten
        tmux new-window -t $SESSION:2 -n 'numcs' -c $HOME/notes/zettelkasten
        tmux new-window -t $SESSION:3 -n 'spca' -c $HOME/notes/zettelkasten
        tmux new-window -t $SESSION:4 -n 'compiler-design' -c $HOME/notes/zettelkasten
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


SESSION="notes"

if ! tmux has-session -t $SESSION 2>/dev/null; then
        echo ":: Creating session $SESSION"
        tmux new-session -d -s $SESSION -c $HOME/notes/zettelkasten
        tmux rename-window -t $SESSION:0 'notes'
        echo ":: Done"
else
        echo ":: Session $SESSION already exists"
fi
