#!/bin/bash

# Get the base name of the current working directory
session_name=$(basename "$PWD")

# Start a new tmux session with the current directory name (or attach if it already exists)
tmux new-session -d -s "$session_name"

# Rename the first window and start Neovim
tmux rename-window -t "$session_name":0 'editor'
tmux send-keys -t "$session_name" 'nvim .' C-m

# Create a second window with lazygit
tmux new-window -t "$session_name" -n 'lazygit'
tmux send-keys -t "$session_name" 'lazygit' C-m

# Create a third window with two panes
tmux new-window -t "$session_name" -n 'shells'

# Split the window into two panes
tmux split-window -h

# Select the first window
tmux select-window -t "$session_name":0

# Attach to the session
tmux attach-session -t "$session_name"

