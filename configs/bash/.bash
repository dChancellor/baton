# Because god forbid you do something with a Mac they don't want you to do
export BASH_SILENCE_DEPRECATION_WARNING=1
cd ~
clear
if command -v nvm >/dev/null 2>&1 || [ -s "$NVM_DIR/nvm.sh" ]; then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    nvm use 18
fi

shopt -s histappend

export HISTSIZE=4998
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind -x '"\C-t": ~/.config/dch/scripts/tmux-session-maker.sh'
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
