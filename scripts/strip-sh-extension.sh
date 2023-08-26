#!/bin/bash

# Check if SCRIPTS_PATH is set and is a directory
if [ -z "$SCRIPTS_PATH" ] || [ ! -d "$SCRIPTS_PATH" ]; then
    echo "SCRIPTS_PATH is not set or is not a valid directory."
    exit 1
fi

# Iterate over .sh files in SCRIPTS_PATH and rename them
for file in "$SCRIPTS_PATH"/*.sh; do
    # Check if file exists to avoid issues with empty directories
    [ -e "$file" ] || continue
    mv "$file" "${file%.sh}"
done

