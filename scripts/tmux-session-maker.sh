#!/usr/bin/env bash

PERSONAL_DIRS="$HOME/chancellor.tech $HOME/scratch.pad $HOME/shopkeep.dev $HOME/grandparobot.dev $HOME/setup" 
WORK_DIRS=""

if [[ "$HOSTNAME" == "indeed" ]]; then
    SEARCH_DIRS="$WORK_DIRS"
else
    SEARCH_DIRS="$PERSONAL_DIRS"
fi

selected=$(find $SEARCH_DIRS -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z $TMUX ]]; then
    tmux -f "$CONFIGS_PATH"/tmux/tmux.conf new-session -s $selected_name -c $selected -n code -d
    tmux new-window -n $selected_name -c $selected -n run
    tmux new-window -n $selected_name -c $selected -n test
    tmux new-window -n $selected_name -c $selected -n storybook
    tmux attach -t $selected_name:1
    exit 0
fi

tmux neww -n $selected_name -c $selected
#tmux new-window -n $selected_name -c $selected -n run
#tmux new-window -n $selected_name -c $selected -n test
#tmux new-window -n $selected_name -c $selected -n storybook
#tmux attach -t $selected_name:1

