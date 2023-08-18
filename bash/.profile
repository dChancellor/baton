# adds my custom scripts to PATH
export PATH="$PATH:/~/.config/dch/scripts"

clear
HOST_NAME=$HOSTNAME

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm use 16

shopt -s histappend

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m'     # Red
txtgrn='\e[0;32m'     # Green
bldgrn='\e[1;32m'     # Bold Green
bldpur='\e[1;35m'     # Bold Purple
bldylw='\[\033[1;33m' # Bold Yellow
txtrst='\e[0m'        # Text Reset

emojis=("👾" "🦊" "🎲" "🐉" "☃️" "🦚" "🦉" "☠️" "👻" "🤖" "🧠" "🏄" "🐵" "🐺" "🦁" "🦄" "🐹" "🐼" "🦥" "🐨" "🐲" "🦖" "🐡" "🐙" "🪼" "🔮" "🎁" "🎊" "🎃")
EMOJI=${emojis[$RANDOM % ${#emojis[@]}]}

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

print_before_the_prompt() {
	dir=$PWD
	home=$HOME
	dir=${dir/"$HOME"/"~"}
	printf "\n $txtrst$EMOJI $txtred$HOST_NAME: $bldpur$dir $txtgrn%s $txtrst\n" "$(parse_git_branch)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1=" \[\033[1;33m\]>\[\033[0m\] "
fortune | cowsay -f koala

function mkcd() {
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls"      # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias vi="nvim ."
alias editnvim="nvim ~/.config/nvim"

############
# Git Aliases
############
alias gadd="git add ."
alias gcommit="git commit -m"

function gwpull {
	current_dir=$(pwd)
	check_dir=$current_dir
	while [[ "$check_dir" != "/" ]]; do
		if [[ -d "$check_dir/primary" ]] || [[ -d "$check_dir/master" ]]; then
			# Check which directory exists and change to that directory.
			if [[ -d "$check_dir/primary" ]]; then
				cd $check_dir/primary
			else
				cd $check_dir/master
			fi
			git pull
			cd $current_dir
			break
		fi
		check_dir=$(dirname "$check_dir")
	done
}
function gwprune() {
	command=$1
	for worktree in $(git worktree list --porcelain | grep 'worktree ' | awk '{print $2}'); do
		printf "\n $worktree\n"
		primary=$(git --git-dir $(git rev-parse --git-common-dir) symbolic-ref --short HEAD)
		printf "\n $primary\n"
		if [ "$worktree" != "$(git --git-dir $(git rev-parse --git-common-dir) symbolic-ref --short HEAD)" ]; then
			printf "\n Removing $worktree ...\n"
			if [ "$command" == "force" ]; then
				git worktree remove $worktree --force
			else
				git worktree remove $worktree
			fi
		else
			printf "\n Skipping current primary worktree: $worktree\n"
		fi
	done
}
###########
# Nav Functions
###########
function up() {
	levels=$1
	while [ "$levels" -gt "0" ]; do
		cd ..
		levels=$(($levels - 1))
	done
}
