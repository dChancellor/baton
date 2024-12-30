
# Check if pipx is installed
if ! command -v pipx &> /dev/null; then
    if [[ "$OS" == "$UBUNTU" ]]; then
        sudo apt update
        echo "Installing pipx.."
        sudo apt install -y pipx
    elif [[ "$OS" == "$MACOS" ]]; then
        if ! command -v brew &> /dev/null; then
            source $SCRIPTS_DIR/install_homebrew.sh
        fi
        echo "Installing pipx.."
        brew install pipx
    else
        echo "Unsupported OS: $OS"
        exit 1
    fi
fi

# use pipx ensurepath to make sure pipx is installed correctly and exit if it was not
if ! command pipx ensurepath &> /dev/null; then
    echo "pipx was not installed correctly. Exiting."
    exit 1
fi

# Install ansible using pipx
echo "Installing ansible.."
pipx install --include-deps ansible

# Update path to include ansible commands
pipx ensurepath

# delete the tmp directory
rm -rf ~/tmp