#!/bin/sh
# skel.sh -- links the "/etc/skel" subset of my dotfiles
# intended usage:
#   $ git clone git://git.alexkarle.com/dotfiles.git
#   $ ./dotfiles/etc/skel.sh
#   $ # manually link any other files
#
# NOTE: .{bash_,}profile is *generated* so that per-site
# customizations can be put in. This script checks that the
# bits worth version controlling are installed properly
set -e
DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

add() {
	dot="$1"
	cmd="$2"
	printf "%s ... " "$dot"
	if test ! -e "$HOME/$dot"
	then
		echo "$cmd" >> "$HOME/$dot"
		echo "new"
	elif grep -q "$cmd" "$HOME/$dot"
	then
		echo "exists"
	else
		echo "$cmd" >> "$HOME/$dot"
		echo "added"
	fi
}

mkdir -p $HOME/.config

# TODO: create full install.sh
"$DIR/bin/lnkdot" .tmux.conf
"$DIR/bin/lnkdot" .config/git
"$DIR/bin/lnkdot" .exrc
add .profile "export PATH=\"$DIR/bin:\$PATH\""
add .profile "export ENV=\"$DIR/.shrc\""
