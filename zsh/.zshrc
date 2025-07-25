setopt autocd
setopt prompt_subst
setopt c_bases

autoload -Uz compinit
autoload -Uz vcs_info

# Compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=*' 'r:|=*'

# VCS_info
zstyle ':vcs_info:*' actionformats \
	'%F{12} %b %F{13}| %F{9}%a%f '
zstyle ':vcs_info:*' formats \
	'%F{12} %b%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{9} : %F{11}%r'

zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%F{default}on %{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}

# Prompt
prompt_col=12
if [ "$EUID" = 0 ]; then prompt_col=9 fi

custom_prompt() {
	local retval=$?

	if (( $prompt_compact )); then
		if (( $retval )); then
			ret_string="%F{red}"
		else
			ret_string="%F{green}"
		fi
		echo " ${ret_string} %F{$prompt_col} "
		return
	fi

	echo " %F{7}%~ $(vcs_info_wrapper)\n %F{$prompt_col} %F{default}"
}

custom-zle-line-init() {
	[[ $CONTEXT == start ]] || return 0

	(( $+zle_bracketed_paste )) && print -r -n - $zle_bracketed_paste[1]
	zle .recursive-edit
	local -i ret=$?
	(( $+zle_bracketed_paste )) && print -r -n - $zle_bracketed_paste[2]

	if [[ $ret == 0 && $KEYS == $'\4' ]]; then
		prompt_compact=1
		zle .reset-prompt
		exit
	fi

	prompt_compact=1
	zle .reset-prompt
	unset prompt_compact

	if (( ret )); then
		zle .send-break
	else
		zle .accept-line
	fi
	return ret
}
zle -N zle-line-init custom-zle-line-init

# Add an extra newline between prompts, but not on the first prompt
precmd() precmd() echo
alias clear="precmd() {precmd() {echo }} && clear"

PS1=$'$(custom_prompt)'
RPROMPT=$''

source $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(fzf --zsh)

export DIFFPROG="nvim -d $1"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"
alias kill="/bin/kill"

alias fzn='nvim "$(fzf --preview="cat {}")"'
alias scd='cd "$(fzf --preview="if [ -d '{}' ]; then ls -la '{}'; else bat '{}'; fi" | xargs -r -I {} dirname "{}")"'
