# Because god forbid you do something with a Mac they don't want you to do
export BASH_SILENCE_DEPRECATION_WARNING=1
cd ~
clear

export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
    nvm use 18
fi

shopt -s histappend

export HISTSIZE=4998
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind -x '"\C-f": fuzzynavigate'

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
