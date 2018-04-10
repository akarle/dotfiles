# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh theme
ZSH_THEME="refined"

# Zsh plugins ( Example format: plugins=(rails git textmate ruby lighthouse) )
# note: zsh-syntax must be last!
plugins=(git zsh-syntax-highlighting docker)

source $ZSH/oh-my-zsh.sh

export DEFAULT_USER="$(whoami)"

# prevent zsh from renaming tmux windows
DISABLE_AUTO_TITLE="true"

# export editor for tmuxinator
export EDITOR="vim"

# 10ms for key sequences
KEYTIMEOUT=1

# vi keymap in terminal
# credit: Doug Black (https://dougblack.io/words/zsh-vi-mode.html)
bindkey -v
# bindkey jk vi-cmd-mode

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# alias for homebrew versions of things
# alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
# alias python python2

# other alias'
# alias pgp='open -a "PariGP"'
# alias vim='nvim'
alias dps="docker ps -a"

# ITALICS UPDATE: may break ssh?
if [ $TERM = 'xterm-256color-italic' ]; then
    alias ssh="TERM='xterm-256color' ssh"
    alias vsh="TERM='xterm-256color' vagrant ssh"
else
    alias vsh="vagrant ssh"
fi

alias vsus="vagrant suspend"
alias vup="vagrant up"

# cd to a parent directory
function pcd { cd ${PWD%/$1/*}/$1; }
