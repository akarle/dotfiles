#!/usr/bin/env bash
# messages.sh
# Code to setup variables for pretty and colorful messages

# Define colors (for printouts)
if tput setaf 1 &> /dev/null; then tput sgr0
    BOLD="$(tput bold)"
    MAGENTA="$(tput setaf 5)"
    GREEN="$(tput setaf 2)"
    RED="$(tput setaf 1)"
    RESET="$(tput sgr0)"
    if [[ $(tput colors) -ge 16 ]] 2>/dev/null; then
        BLUE="$(tput setaf 12)"
        ORANGE="$(tput setaf 11)"
    else
        BLUE="$(tput setaf 4)"
        ORANGE="$(tput setaf 3)"
    fi
else
    BLUE=""
    BOLD=""
    ORANGE=""
    RED=""
    GREEN=""
    RESET=""
fi

# Helper functions
success_msg() {
    echo "${GREEN}$1${RESET}"
}

warn_msg() {
    echo "${ORANGE}$1${RESET}"
}

error_msg() {
    echo "${RED}$1${RESET}"
}
