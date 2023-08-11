#!/bin/bash

# Delete the existing nvim-bak directory if it exists
if [ -d "$HOME/.config/nvim-bak" ]; then
  echo "Deleting existing nvim-bak directory..."
  rm -rf "$HOME/.config/nvim-bak"
fi

# Move existing nvim directory to nvim-bak
if [ -d "$HOME/.config/nvim" ]; then
  echo "Moving existing nvim directory to nvim-bak..."
  mv "$HOME/.config/nvim" "$HOME/.config/nvim-bak"
fi

# Copy the nvim directory from the parent directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -d "$SCRIPT_DIR/../nvim" ]; then
  echo "Copying new nvim directory to ~/.config/nvim..."
  cp -r "$SCRIPT_DIR/../nvim" "$HOME/.config/nvim"
else
  echo "The nvim directory was not found in the parent directory of this script."
  exit 1
fi

echo "Operation completed successfully."

