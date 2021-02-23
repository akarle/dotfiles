#!/bin/sh
# install.sh -- full install via skel.sh/lnkdot
set -e
DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

. "$DIR/etc/skel.sh"
add .bash_profile "export ENV=\"$DIR/.shrc\""
add .bash_profile "[ -e \"$DIR/.bashrc\" ] && source \"$DIR/.bashrc\""

# Generic .dotfiles
for f in `find $DIR -maxdepth 1 -name '.*' -type f | grep -v git | sed "s#^$DIR/##"`; do
	"$DIR/bin/lnkdot" $f
done

# Generic .config dirs
for d in `find $DIR/.config -maxdepth 1 -mindepth 1 -type d | sed "s#^$DIR/##"`; do
	"$DIR/bin/lnkdot" $d
done

# Other exceptions
"$DIR/bin/lnkdot" .vim
mkdir -p $HOME/.newsboat
"$DIR/bin/lnkdot" .newsboat/urls
