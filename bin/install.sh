#!/usr/bin/env bash
# This script sets up all dotfiles from scratch
# PREREQS: git
#
# NOTE: will not overwrite anything that already exists
# other than .akarledots (which will get backed up)
#
# If you want to just do symlinking, see ./link.sh

# Before anything, require git to be installed
if ! [ -x "$(command -v git)" ]; then
  echo "Error: git is not installed. Aborting..." >&2
  exit 1
fi

# Establish Globals
HOMEDOTS=$HOME/.akarledots
DOTVIM=$HOME/.vim

# Load messages colors + functions
source $HOMEDOTS/bin/messages.sh

install_via_curl() {
    echo "Would you like to install $1 (via curl)"
    select opt in "Yes" "No"; do
        case $opt in
            "Yes" )
                curl -fLo "$3" --create-dirs "$2"
                break
                ;;
            "No" )
                echo "Not installing $1"
                break
                ;;
        esac
    done
    echo ""
    echo ""
}

# First, backup old copies
if [ -d $HOMEDOTS ]; then
    BACKUP="${HOMEDOTS}_backup_$(date +%s)"
    mv $HOMEDOTS $BACKUP
    warn_msg "Backing up old $HOMEDOTS to $BACKUP"
fi

# Next, clone a fresh one
git clone https://github.com/akarle/dotfiles.git $HOMEDOTS
success_msg "Clone successful! Putting you on your own branch '$(whoami)' so you can make changes!"
(cd $HOMEDOTS && exec git checkout -b $(whoami))

# Do linking
success_msg "Linking..."
source $HOMEDOTS/bin/link.sh

# Now for Vim
if [ -d $DOTVIM ]; then
    BACKUP="${DOTVIM}_backup_$(date +%s)"
    mv $DOTVIM $BACKUP
    warn_msg "Backing up old $DOTVIM to $BACKUP"
fi

git clone --recurse-submodules https://github.com/akarle/dotvim.git $DOTVIM
success_msg "Successfully cloned dotvim to $DOTVIM. Woot!"

printf "\n\n"

# Optional installs via curl:
if [ -x "$(command -v curl)" ]; then
    # vim-plug
    install_via_curl \
        "vim-pathogen" \
        "https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim" \
        "$HOME/.vim/autoload/pathogen.vim"

    # git bash/zsh completion
    install_via_curl \
        "bash completion" \
        "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" \
        "$HOME/.bash/git-completion.bash"
fi

# Logo a la oh-my-zsh (for funsies)
printf ${MAGENTA}
echo ""
echo "Thank you for installing..."
printf ${BOLD}${BLUE}
echo "          _              _          _       _        "
echo "         | |            | |        | |     | |       "
echo "     __ _| | ____ _ _ __| | ___  __| | ___ | |_ ___  "
echo "    / _  | |/ / _  | '__| |/ _ \/ _  |/ _ \| __/ __| "
echo "${MAGENTA} _${BLUE} | (_| |   ( (_| | |  | |  __/ (_| | (_) | |_\__ \ "
echo "${MAGENTA}(_)${BLUE} \__,_|_|\_\__,_|_|  |_|\___|\__,_|\___/ \__|___/ "
printf ${RESET}
echo ""

# source bash
source ~/.bashrc
