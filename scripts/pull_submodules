# Get the default branch from the git config

default_branch=$(git config --get init.defaultBranch)

# Pull submodules for the project and update to latest commit on primary branch

echo "Pulling submodules for project..."
git submodule update --init --recursive
git submodule foreach git checkout $default_branch
