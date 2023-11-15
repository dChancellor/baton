# Function to install packages on Ubuntu
install_ubuntu() {
    sudo apt-get update
    sudo apt-get upgrade
    sudo timedatectl set-timezone America/Chicago

    # Install Neovim
    sudo apt-get install ninja-build gettext cmake unzip curl
    make -C "$INSTALL_PATH"/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make -C "$INSTALL_PATH"/neovim install

    # Install Tmux
    sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config autotools-dev automake
    sh "$INSTALL_PATH"/tmux/autogen.sh
    $INSTALL_PATH/tmux/.configure
    make -C "$INSTALL_PATH"/tmux
    sudo make -C "$INSTALL_PATH"/tmux install

    # Install fzf
    "$INSTALL_PATH"/fzf/install --all

    rm -rf "$INSTALL_PATH"/bin
}

# Function to install packages on macOS using Homebrew
install_mac() {
    brew install neovim
    brew install fzf
    brew install tmux
}

# Detect the operating system
OS="$(uname)"

# Check if the operating system is Ubuntu or macOS and call the appropriate function
if [[ "$OS" == "Linux" ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        install_ubuntu
    else
        echo "This script is only for Ubuntu and macOS."
    fi
elif [[ "$OS" == "Darwin" ]]; then
    install_mac
else
    echo "This script is only for Ubuntu and macOS."
fi