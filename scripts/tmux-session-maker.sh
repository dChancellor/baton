#!/usr/bin/env bash

PERSONAL_DIRS="$HOME/chancellor.tech $HOME/scratch.pad $HOME/shopkeep.dev $HOME/grandparobot.dev $HOME/setup" 
WORK_DIRS=""

if [[ "$HOSTNAME" == "indeed" ]]; then
    SEARCH_DIRS="$WORK_DIRS"
else
    SEARCH_DIRS="$PERSONAL_DIRS"
fi

selected=$(find $SEARCH_DIRS -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z $TMUX ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

tmux neww -n $selected_name -c $selected
