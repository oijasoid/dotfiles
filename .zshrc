setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{12} %b %F{13}| %F{9}%a%f '
zstyle ':vcs_info:*' formats       \
    '%F{12} %b%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{9} : %F{11}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PS1=$' %F{11}\Uf061 '
RPROMPT=$'%F{8}%~ $(vcs_info_wrapper)'

source $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
