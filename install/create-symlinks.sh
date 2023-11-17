create_symlink() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: create_symlink <source> <link_target>"
        return 1
    fi

    local source_target="$1"
    local link_target="${2/#\~/$HOME}"


    # Expand the source and link target to their absolute paths
    if [[ -e "$source_target" ]]; then
        source_target="$(realpath "$source_target")"
    else
        echo "Error: Source target '$source_target' does not exist."
        return 1
    fi

    # Check if the source target is a directory
    if [[ -d "$source_target" ]]; then
        echo "'$source_target' is a directory. Creating or updating symlink."
        mkdir -p "$(dirname "$link_target")"
        ln -sfn "$source_target" "$link_target"
        return 0
    fi

    # Read the content from the source file
    local content_to_append="$(cat "$source_target")"

    # Check if the target is a symlink or a regular file
    if [ -L "$link_target" ] || [ -f "$link_target" ]; then
        # Check if the content from the source file is already in the target file
        if ! grep -qF "# Added by DCH setup file" "$link_target"; then
            echo "$link_target exists and specific content not found - appending content..."
            # Append a newline character if the file does not end with one
            [[ $(tail -c1 "$link_target" | wc -l) -eq 0 ]] && echo "" >> "$link_target"
            # Append the comment and the contents from the source file
            {
                echo ""
                echo "# Added by DCH setup file"
                echo "$content_to_append"
            } >> "$link_target"
        else
            echo "Specific content already exists in '$link_target'. Not appending."
        fi
    else
        echo "$link_target does not exist - creating a symlink."
        mkdir -p "$(dirname "$link_target")"
        ln -s "$source_target" "$link_target"
    fi
}

source "../configs/bash/.vars" # Load common variables

create_symlink "../configs/bash/.profile" "~/.profile"
source ~/.profile
create_symlink "../configs/" "$CONFIGS_PATH"
create_symlink "../nvim/" "~/.config/nvim"
create_symlink "../scripts/" "$SCRIPTS_PATH"