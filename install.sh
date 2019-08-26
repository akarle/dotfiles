#!/usr/bin/env bash
# simple install via dotfiler
# PREREQS: git

if ! [ -x "$(command -v git)" ]; then
  echo "Error: git is not installed. Aborting..." >&2
  exit 1
fi

mkdir -p $HOME/.config
mkdir -p $HOME/dev/proj

echo "Installing dotvim   -> $HOME/.vim"
git clone --recursive https://github.com/akarle/dotvim $HOME/.vim || exit 1
echo "Installing dotfiler -> $HOME/dev/proj/dotfiler"
git clone https://github.com/akarle/dotfiler $HOME/dev/proj/dotfiler || exit 1

echo "Using dotfiler to link bash (bare minimum)"
PATH=$HOME/dev/proj/dotfiler:$PATH
dotfiler.pl -d $HOME/dev/dotfiles -l bash tmux
