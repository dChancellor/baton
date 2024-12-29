# Pull submodules for the project and update to latest commit on primary branch

git submodule update --init --recursive
git submodule foreach git pull origin primary
