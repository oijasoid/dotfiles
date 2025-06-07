setopt autocd
setopt prompt_subst
setopt c_bases

autoload -Uz compinit
autoload -Uz vcs_info

# Compinit
fpath=($HOME/.config/zsh/completions $fpath)
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
custom_prompt() {
	local retval=$?

	if (( $prompt_compact )); then
		if (( $retval )); then
			ret_string="%F{red}"
		else
			ret_string="%F{green}"
		fi
		echo " ${ret_string} %F{12} "
		return
	fi

	echo " %F{7}%~ $(vcs_info_wrapper)\n %F{12} %F{default}"
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

export DIFFPROG="nvim -d $1"
alias vi="nvim"
