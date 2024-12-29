#!/bin/bash

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

install_homebrew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo apt-get install build-essential
	brew install gcc
}

# Function to install packages on Ubuntu
install_ubuntu() {
	git submodule --init --recursive

	sudo apt-get update
	sudo apt-get upgrade
	sudo timedatectl set-timezone America/Chicago

	sudo apt-get install fd-find

	# Install fun cli items
	sudo apt install cowsay
	sudo apt install fortune-mod
	sudo apt install chafa

	git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git ~/.setup/temp/pokemon-colorscripts
	sudo ./~/.setup/temp/pokemon-colorscripts/install.sh

	#Install brew
	install_homebrew

	# Install LSPs for neovim
	install_nvim_lsps
}

install_nvim_lsps() {
	brew install lua-language-server
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
	brew install chafa

	git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git ~/.setup/temp/pokemon-colorscripts
	sudo ./~/.setup/temp/pokemon-colorscripts/install.sh

	install_nvim_lsps
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
	return 0
fi
