#!/bin/bash

# Remove existing nvim caches
  echo "Deleting existing nvim caches.."
  rm -rf "$HOME/.local/share/nvim"
  rm -rf "$HOME/.local/state/nvim"

# Backup the existing nvim config
if [ -f "$HOME/.confing/nvim" ]; then
  echo "Moving existing nvim to custom backup"
  mv "$HOME/.config/nvim" "$HOME/.config/nvim-clean-bak"
fi

echo "Operation completed successfully."

