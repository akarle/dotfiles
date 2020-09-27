# dotvim

My personal Vim configuration.

## Install

Mac/Linux:

```sh
git clone --recurse-submodules https://github.com/akarle/dotfiles ~/dotfiles
ln -s ~/dotfiles/vim ~/.vim
```

Windows:

If you can't figure out how to get symlinks to work (or they don't work, I never
understood them on Windows), set up a minimal vimrc that uses ~/dotfiles/vim as
the ~/vimfiles:

```sh
git clone --recurse-submodules https://github.com/akarle/dotfiles ~/dotfiles
cat <<EOM > ~/_vimrc
set rtp ^= ~/dotfiles/vim
set rtp += ~/dotfiles/vim/after
set pp = &rtp
source ~/dotfiles/vim/vimrc
EOM
```
