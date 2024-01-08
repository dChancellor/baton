export DOTFILE_PATH="$HOME/.config/dch"
source "$DOTFILE_PATH/configs/bash/.vars"
source "$DOTFILE_PATH/configs/bash/.aliases"
source "$DOTFILE_PATH/configs/bash/.functions"
source "$DOTFILE_PATH/configs/bash/.bash"

if [ -n "${INDEED_ENV_DIR}" ]; then
  source "$DOTFILE_PATH/configs/bash/.indeed"
fi