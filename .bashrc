#!/usr/bin/env bash
# .bashrc
# The way I like to roll in the shell

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Settings
stty -ixon             # Disable XON/XOFF to allow forward search w CTRL-S
shopt -s checkwinsize  # check win size after each cmd, update if needed
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=10000         # Max lines in history (in memory)
HISTFILESIZE=200000    # Max size of the history file
HISTIGNORE=fg:pwd:ls   # Don't store common commands in history
HISTCONTROL=ignoreboth # Don't store duped / whitespace-led commands in history
PROMPT_COMMAND="history -a" # Record history after each command

# Includes
include() { [ -r "$1" ] && source "$1"; }
include "$HOME/.shrc"                     # Common shell configuration
include "$HOME/.bash/git-completion.bash" # Git Completion
include "$HOME/etc/console_theme.sh"      # Virtual Console colors (if TERM == "linux")
include "$HOME/.bashrc.local"             # System specific settings

if [ -n "$USE_FANCY_PROMPT" ]; then
    parse_git_dirty() {
        if [ -z "$BASH_PROMPT_NO_GSTATUS" ]; then
            [ "$(git status --porcelain=v1 2> /dev/null)" ] && echo "*"
        fi
    }

    git_info() {
        git branch --no-color 2> /dev/null |
            sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
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

        PS1_TOP="$BOLD$RED\$(last_err)$BLUE\w $RESET$GRAY$SSH_PROMPT\$(git_info)"
        PS1="$PS1_TOP\n$BOLD$MAGENTA\$ $RESET"
        PS2="$YELLOW> $RESET"
    fi
fi

# Git completion for ~/.aliases
if [ -n "$(type -t __git_complete)" ] &&
   [ "$(type -t __git_complete)" == "function" ]; then
    __git_complete ga _git_add
    __git_complete gco _git_checkout
    __git_complete gd _git_diff
    __git_complete gr _git_rebase
    __git_complete gb _git_branch
fi

alias rb='source ~/.bashrc'