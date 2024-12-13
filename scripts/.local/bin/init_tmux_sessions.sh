#!/usr/bin/env zsh


# Name of the tmux session
SESSIONS=(
"school"
"config"
"tmp"
"resources"
)

# Create a new tmux session in detached mode
for session in "${SESSIONS[@]}"; do
  tmux has-session -t $session 2>/dev/null
        # $? checks if the last command failed (non-zero return status)
        if [ $? != 0 ]; then
          # Create a new tmux session in detached mode
          tmux new-session -d -s $SESSION_NAME

          # Create new windows in the tmux session
          tmux new-window -t $SESSION_NAME:1 -n "Window1"  # Create window 1
          tmux new-window -t $SESSION_NAME:2 -n "Window2"  # Create window 2
          tmux new-window -t $SESSION_NAME:3 -n "Window3"  # Create window 3

          # You can also run specific commands in each window, like:
          # tmux send-keys -t $SESSION_NAME:1 'top' C-m

          # Attach to the tmux session
          tmux attach-session -t $SESSION_NAME
        else
          # If the session already exists, just attach to it
          tmux attach-session -t $SESSION_NAME
        fi


  if [ $? != 0 ]; then
    tmux new-session -d -s $session
  fi
done



