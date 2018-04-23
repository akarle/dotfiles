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

# Helper functions
try_mkdir() {
    if [ ! -d $1 ]; then
        echo "Making directory $1"
        mkdir $1
    fi
}

try_ln() {
    # if it doesn't exist, just create it -- works for broken symlinks too!
    if [ ! -f $2 ]; then
        echo "Creating soft symlink from $1 to $2"
        ln -s $1 $2
    # if its a symlink replace it
    elif [ -L $2 ]; then
        echo "$2 is a symlink already, replacing it with a symlink to $1"
        rm $2
        ln -s $1 $2
    # if it exists but is not a symlink
    else
        echo "$2 exists as a file that is NOT a symlink. What would you like to do?"
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
    echo "Backing up old $HOMEDOTS to $BACKUP"
fi

# Next, clone a fresh one
try_mkdir $HOMEDOTS
git clone https://github.com/akarle/dotfiles.git $HOMEDOTS

# $HOME level ln's
try_ln $DOTSVIM/vimrc $HOME/.vimrc
try_ln $HOMEDOTS/tmux.conf $HOME/.tmux.conf
try_ln $HOMEDOTS/zshrc $HOME/.zshrc

# Symlink HOMEDOTS/vim -> ~/.vim
try_ln $HOMEDOTS/vim $VIMHOME

# Make the swp and undo folders in ~/.vim
try_mkdir $VIMHOME/undo
try_mkdir $VIMHOME/swp
