#!/bin/bash
# This script sets up the dotfiles
# PREREQS: git
# NOTE: will not overwrite anything that already exists
# other than .akarledots (which will get backed up)

# Before anything, require git to be installed
if ! [ -x "$(command -v git)" ]; then
  echo "Error: git is not installed. Aborting..." >&2
  exit 1
fi

# Establish Globals
HOMEDOTS=$HOME/.akarledots
VIMHOME=$HOME/.vim
DOTSVIM=$HOMEDOTS/vim

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

try_mkdir() {
    if [ ! -d $1 ]; then
        success_msg "Making directory $1"
        mkdir $1
    fi
}

try_ln() {
    # if it doesn't exist, just create it -- works for broken symlinks too!
    if [ ! -f $2 ]; then
        success_msg "Creating soft symlink from $1 to $2"
        ln -s $1 $2
    # if its a symlink replace it
    elif [ -L $2 ]; then
        warn_msg "$2 is a symlink already, replacing it with a symlink to $1"
        rm $2
        ln -s $1 $2
    # if it exists but is not a symlink
    else
        error_msg "$2 exists as a file that is NOT a symlink. What would you like to do?"
        OPT1="Move it to $HOMEDOTS for further inspection and add akarledots link in its place"
        OPT2="Delete and replace it with akarledots link"
        OPT3="Keep it and do not create akarledots link"
        select opt in "$OPT1" "$OPT2" "$OPT3"; do
            case $opt in
                $OPT1 )
                    TMPFILE=$2.BACKUP
                    mv $2 $TMPFILE
                    mv $TMPFILE $HOMEDOTS/
                    ln -s $1 $2
                    break
                    ;;
                $OPT2 )
                    rm $2
                    ln -s $1 $2
                    break
                    ;;
                $OPT3 )
                    echo "Not altering $2"
                    break
                    ;;
            esac
        done
    fi
}

# First, backup old copies
if [ -d $HOMEDOTS ]; then
    BACKUP="${HOMEDOTS}_backup_$(date +%s)"
    mv $HOMEDOTS $BACKUP
    warn_msg "Backing up old $HOMEDOTS to $BACKUP"
fi

# Next, clone a fresh one
try_mkdir $HOMEDOTS
git clone https://github.com/akarle/dotfiles.git $HOMEDOTS
success_msg "Clone successful! Putting you on your own branch '$(whoami)' so you can make changes!"
(cd $HOMEDOTS && exec git checkout -b $(whoami))

# $HOME level ln's
try_ln $DOTSVIM/vimrc $HOME/.vimrc
try_ln $HOMEDOTS/tmux.conf $HOME/.tmux.conf
try_ln $HOMEDOTS/zshrc $HOME/.zshrc

for file in $HOMEDOTS/bash/*; do
    [ -e "$file" ] || continue
    try_ln $file $HOME/.$(basename $file)
done
unset file

# Symlink HOMEDOTS/vim -> ~/.vim
try_ln $HOMEDOTS/vim $VIMHOME

# Make the swp and undo folders in ~/.vim
try_mkdir $VIMHOME/undo
try_mkdir $VIMHOME/swp

# Optional install of vim-plug:
printf "\n\n"
echo "Would you like to install vim-plug (via curl)"
select opt in "Yes" "No"; do
    case $opt in
        "Yes" )
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            break
            ;;
        "No" )
            echo "Not installing vim-plug"
            break
            ;;
    esac
done

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
