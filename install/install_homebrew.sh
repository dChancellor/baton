echo "Installing homebrew.."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if ! command -v brew &> /dev/null; then
    echo "Homebrew was not installed correctly. Exiting."
    exit 1
fi