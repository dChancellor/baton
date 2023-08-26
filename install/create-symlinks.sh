create_symlink() {
    # Check if the right number of arguments are provided
    if [[ $# -ne 2 ]]; then
        echo "Usage: create_symlink <source> <link_target>"
        return 1
    fi

    local source_target="$1"
    local link_target="$2"

    # Check if the source target exists
    if [[ ! -e $source_target ]]; then
        echo "Error: Source target '$source_target' does not exist."
        return 1
    fi

    # Ensure the parent directory of the link target exists
    mkdir -p "$(dirname "$link_target")"

    # Create the symlink
    ln -s "$source_target" "$link_target"
}

create_symlink "$HOME/setup/bash/.profile" "~/.profile"
create_symlink "$HOME/setup/configs/" "$CONFIG_DIR"
create_symlink "$HOME/setup/nvim/" "/.config/nvim"
create_symlink "$HOME/setup/scripts/" "$SCRIPTS_DIR"
