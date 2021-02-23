#!/bin/sh
# install.sh -- full install via skel.sh/lnkdot
set -e
DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

. "$DIR/etc/skel.sh"
add .bash_profile "[ -e \"$DIR/.bashrc\" ] && source \"$DIR/.bashrc\""

# Generic .dotfiles
for f in `find $DIR -type f -maxdepth 1 -name '.*' | grep -v git | sed "s#^$DIR/##"`; do
	"$DIR/bin/lnkdot" $f
done

# Generic .config dirs
for d in `find $DIR/.config -type d -maxdepth 1 -mindepth 1 | sed "s#^$DIR/##"`; do
	"$DIR/bin/lnkdot" $d
done

# Other exceptions
"$DIR/bin/lnkdot" .vim
mkdir -p $HOME/.newsboat
"$DIR/bin/lnkdot" .newsboat/urls
