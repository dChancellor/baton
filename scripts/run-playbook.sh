#!/bin/bash

# Check if a playbook path argument is provided
if [ -z "$1" ]; then
	echo "Usage: $0 <path_to_playbook>"
	exit 1
fi

# Get the path to the playbook from the first argument
PLAYBOOK_PATH="$1"

# Check if the playbook file exists
if [ ! -f "$PLAYBOOK_PATH" ]; then
	echo "Error: Playbook file '$PLAYBOOK_PATH' not found."
	exit 1
fi

# Run the ansible-playbook command with the specified roles-path
ANSIBLE_NOCOWS=1 ansible-playbook ---roles-path=../roles i localhost, --connection=local "$PLAYBOOK_PATH --ask-become-pass
