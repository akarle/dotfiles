#!/usr/bin/env bash
# .bashrc
# The way I like to roll in the shell

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Functions
include() { [ -r "$1" ] && source "$1"; }
aw()  { w3m "https://wiki.archlinux.org/index.php?search=$1"; }
ddg() { w3m "https://duckduckgo.com/lite?q=$1"; }
last_err() {
    err="$?"
    if [ $err -ne "0" ]; then
        echo "($err) "
    fi
}

# Load ~/.shrc from $ENV (similar to sh(1)'s init)
include "$ENV"

# Settings / Shell Variables
stty -ixon             # Disable XON/XOFF to allow forward search w CTRL-S
shopt -s checkwinsize  # check win size after each cmd, update if needed
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=10000         # Max lines in history (in memory)
HISTFILESIZE=200000    # Max size of the history file
HISTIGNORE=fg:pwd:ls   # Don't store common commands in history
HISTCONTROL=ignoreboth # Don't store duped / whitespace-led commands in history
PROMPT_COMMAND="history -a" # Record history after each command

if [ -n "$PRETTY_COLORS" ]; then
    # ls colors
    if ls --color &>/dev/null; then
        alias ls='ls --color'
    elif ls -G &>/dev/null; then
        alias ls='ls -G'
    elif colorls -G &>/dev/null; then
        alias ls='colorls -G'
    fi

    parse_git_dirty() {
        if [ -z "$BASH_PROMPT_NO_GSTATUS" ]; then
            [ -n "$(git status --porcelain=v1 2>/dev/null)" ] && echo "*"
        fi
    }

    git_info() {
        echo " $(git branch --show-current 2>/dev/null)$(parse_git_dirty)"
    }

    # Preferred Prompt: fancy with colors from tput
    if tput setaf 1 &> /dev/null; then
        tput sgr0 # reset effects of test command
        RED="\[$(tput setaf 1)\]"
        MAGENTA="\[$(tput setaf 5)\]"
        YELLOW="\[$(tput setaf 3)\]"
        GRAY="\[$(tput setaf 8)\]"
        BLUE="\[$(tput setaf 4)\]"
        BOLD="\[$(tput bold)\]"
        RESET="\[$(tput sgr0)\]"

        PS1_TOP="$BOLD$RED\$(last_err)$BLUE\w $RESET$GRAY[\u@\h]\$(git_info)"
        PS1="$PS1_TOP\n$BOLD$MAGENTA\$ $RESET"
        PS2="$YELLOW> $RESET"
    else
        PS1="\$(last_err)\w [\u@\h]\$(git_info)\n\$ "
    fi
fi

# Include .local version last as override mechanism
include "$HOME/.bashrc.local"
