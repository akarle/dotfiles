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
HOMEDOTS=$HOME/.dotfiles
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
    if [ ! -f $1 ]; then
        echo "Creating soft symlink from $2 to $1"
        ln -s $2 $1
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

# Special $HOME level ln's
try_ln $DOTSVIM/vimrc $HOME/.vimrc
try_ln $HOMEDOTS/tmux.conf $HOME/.tmux.conf
try_ln $HOMEDOTS/zshrc $HOME/.zshrc

# Extra Vim setup
try_mkdir $VIMHOME
try_mkdir $VIMHOME/undo
try_mkdir $VIMHOME/swp
try_mkdir $VIMHOME/ftplugin

# all non-ftplugins
for file in $DOTSVIM/*.vim; do
    [ -e "$file" ] || continue
    try_ln $file $VIMHOME/$(basename $file)
done

# ftplugins TODO: better way of recursing through subdirectories
for file in $DOTSVIM/ftplugin/*.vim; do
    [ -e "$file" ] || continue
    try_ln $file $VIMHOME/ftplugin/$(basename $file)
done
