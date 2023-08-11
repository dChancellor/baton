#!/bin/bash

# Determine the parent directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$SCRIPT_DIR/.."

# Remove and copy the nvim directory if it exists
if [ -d "$HOME/.config/nvim" ]; then
  if [ -d "$PARENT_DIR/nvim" ]; then
    echo "Removing existing nvim directory at $PARENT_DIR/nvim..."
    rm -rf "$PARENT_DIR/nvim"
  fi
  echo "Copying ~/.config/nvim directory to $PARENT_DIR/nvim..."
  cp -r "$HOME/.config/nvim" "$PARENT_DIR/nvim"
else
  echo "The nvim directory was not found."
fi

# Remove and copy the .profile file if it exists
if [ -f "$HOME/.profile" ]; then
  if [ -f "$PARENT_DIR/bash/.profile" ]; then
    echo "Removing existing .profile file at $PARENT_DIR/bash/.profile..."
    rm "$PARENT_DIR/bash/.profile"
  fi
  echo "Copying ~/.profile file to $PARENT_DIR/bash..."
  mkdir -p "$PARENT_DIR/bash" # Ensure the destination directory exists
  cp "$HOME/.profile" "$PARENT_DIR/bash/.profile"
else
  echo "The .profile file was not found."
fi

echo "Operation completed successfully."

