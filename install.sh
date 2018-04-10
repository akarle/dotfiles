#!/bin/bash
# This script sets up the dotfiles

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

# Set up vimrc
VIMHOME=$HOME/.vim
GITVIM=$HOME/git/dotfiles/vim
FTPLUGDIR=$VIMHOME/ftplugin

try_mkdir $VIMHOME
try_mkdir $FTPLUGDIR

try_ln $GITVIM/vimrc $HOME/.vimrc
try_ln $GITVIM/theme.vim $VIMHOME/theme.vim
try_ln $GITVIM/plugins.vim $VIMHOME/plugins.vim
try_ln $GITVIM/pluginsettings.vim $VIMHOME/pluginsettings.vim
try_ln $GITVIM/keys.vim $VIMHOME/keys.vim
try_ln $GITVIM/functions.vim $VIMHOME/functions.vim
try_ln $GITVIM/ftplugin/tex.vim $FTPLUGDIR/tex.vim
try_ln $GITVIM/ftplugin/python.vim $FTPLUGDIR/python.vim

# Link tmux conf
try_ln $HOME/git/dotfiles/tmux.conf $HOME/.tmux.conf

# Link zshrc
try_ln $HOME/git/dotfiles/zshrc $HOME/.zshrc
