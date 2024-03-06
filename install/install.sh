# Function to install packages on Ubuntu
install_ubuntu() {
    sudo apt-get update
    sudo apt-get upgrade
    sudo timedatectl set-timezone America/Chicago
    # Install Neovim
    sudo apt-get install ninja-build gettext cmake unzip curl rg
    sudo make -C "$INSTALL_PATH"/neovim CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make -C "$INSTALL_PATH"/neovim install

    # Install Tmux
    sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config autotools-dev automake
    sh "$INSTALL_PATH"/tmux/autogen.sh
    $INSTALL_PATH/tmux/.configure
    make -C "$INSTALL_PATH"/tmux
    sudo make -C "$INSTALL_PATH"/tmux install

    # Install fzf
    "$INSTALL_PATH"/fzf/install --all

    # This line scares me - what is bin? When I figure it out, please add comment here why this line was needed
    #rm -rf "$INSTALL_PATH"/bin

    # Install fun cli items
    sudo apt install cowsay
    sudo apt install fortune-mod
}

# Function to install packages on macOS using Homebrew
install_mac() {
    # Allows "extra" casks to be included/searched for/installed
    brew tap homebrew/cask-versions

    brew install neovim
    brew install fzf
    brew install tmux
    brew install cowsay
    brew install fortune
    brew install ripgrep
    brew install --cask obsidian
    brew install --cask alt-tab
    brew install --cask logi-options-plus
    brew install --cask hiddenbar
    brew install --cask figma
    brew install --cask spotify
    brew install --cask vlc
    brew install --cask kap
    brew install --cask iterm2
    brew install --cask raycast
    brew install --cask rectangle
    brew install homebrew/cask-versions/firefox-developer-edition    
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
    return 0;
fi
