#!/usr/bin/env bash

source $CONFIGS_PATH/bash/.functions
selected="$(fuzzyfind)"

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z $TMUX ]]; then
    tmux -f "$CONFIGS_PATH"/tmux/tmux.conf new-session -s $selected_name -c $selected -n code -d
    tmux new-window -n $selected_name -c $selected -n run
    tmux new-window -n $selected_name -c $selected -n test
    tmux new-window -n $selected_name -c $selected -n storybook

    tmux send-keys -t $selected_name:1 'vi' C-m
    tmux send-keys -t $selected_name:2 'npm run start' C-m
    tmux send-keys -t $selected_name:3 'npm run test' C-m
    tmux send-keys -t $selected_name:4 'npm run storybook' C-m

    tmux attach -t $selected_name:1
    exit 0
fi

tmux neww -n $selected_name -c $selected
#tmux new-window -n $selected_name -c $selected -n run
#tmux new-window -n $selected_name -c $selected -n test
#tmux new-window -n $selected_name -c $selected -n storybook
#tmux attach -t $selected_name:1

