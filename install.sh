#!/bin/sh
# Minimal install (no prereqs, just the basics)
# Intended to be run on a new account, NOT for long term management
# However, should be safe to rerun to fix/tune-up an existing install
set -e

DOTFILES="$( cd "$(dirname "$0")" ; pwd -P )"

# ln with the right settings and a nicer message
try_ln() {
    # bail out early if source doesn't exist
    [ -e "$1" ] || return 0

    # we know source is legit, set up dest
    if [ -e "$2" ]; then
        if [ -h "$2" ]; then
            if [ `readlink $2` = "$1" ]; then
                echo "[Up to Date  ] $2" | sed "s#$HOME#~#"
            else
                ln -snf $1 $2
                echo "[Updated Link] $2" | sed "s#$HOME#~#"
            fi
        else
            echo "[Fail:Exists ] $2" | sed "s#$HOME#~#"
            return
        fi
    else
        ln -snf $1 $2
        echo "[New         ] $2" | sed "s#$HOME#~#"
    fi
}

# bin scripts
mkdir -p $HOME/bin
for f in $DOTFILES/bin/*; do
    try_ln $f $HOME/bin/`basename $f`
done

# XDG_CONFIG_HOME dirs
mkdir -p $HOME/.config
for d in mutt offlineimap git nvim; do
    try_ln $DOTFILES/$d $HOME/.config/$d
done

# Traditional dotfiles
for d in bash tmux gdb X11 sh vi mbsync; do
    for f in $DOTFILES/$d/*; do
        try_ln $f $HOME/.`basename $f`
    done
done

# Special cases
try_ln $DOTFILES/vim $HOME/.vim
try_ln $DOTFILES/deps/pash/pash $HOME/bin/pash
