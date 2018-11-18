#!/usr/bin/env bash
# link.sh
# Handles all (re)linking of dotfiles to their appropriate place

# Establish Globals
HOMEDOTS=$HOME/.akarledots
DOTVIM=$HOME/.vim
CONFDIR=$HOME/.config

# Load messages colors + functions
source $HOMEDOTS/bin/messages.sh

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

# $HOME level ln's
try_ln $HOMEDOTS/tmux.conf $HOME/.tmux.conf
try_ln $HOMEDOTS/zsh/zshrc $HOME/.zshrc
try_ln $HOMEDOTS/inputrc $HOME/.inputrc
try_ln $HOMEDOTS/screenrc $HOME/.screenrc

# .config lns
try_ln $HOMEDOTS/alacritty.yml $CONFDIR/alacritty/alacritty.yml
try_ln $HOMEDOTS/neovim/init.vim $CONFDIR/nvim/init.vim

# bash lns
for file in $HOMEDOTS/bash/*; do
    [ -e "$file" ] || continue
    try_ln $file $HOME/.$(basename $file)
done
unset file
