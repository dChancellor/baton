#!/bin/bash

# Define the backup file path
PROFILE_BAK="$HOME/.profile-bak"

# Check if the backup file exists and delete it if it does
if [ -f "$PROFILE_BAK" ]; then
  echo "Deleting existing .profile-bak file..."
  rm "$PROFILE_BAK"
fi

# Check if the .profile file exists and move it to .profile-bak if it does
if [ -f "$HOME/.profile" ]; then
  echo "Moving existing .profile file to .profile-bak..."
  mv "$HOME/.profile" "$PROFILE_BAK"
fi

# Determine the path of the new .profile file in the parent directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NEW_PROFILE="$SCRIPT_DIR/../bash/.profile"

# Check if the new .profile file exists and copy it if it does
if [ -f "$NEW_PROFILE" ]; then
  echo "Copying new .profile file to ~/.profile..."
  cp "$NEW_PROFILE" "$HOME/.profile"
else
  echo "The .profile file was not found in the parent directory of this script."
  exit 1
fi

echo "Operation completed successfully."

