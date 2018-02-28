# dotfiles
My dotfiles.

## Basic Setup
1. My vimrc is tailored for Vim 8
2. Set up Vim-Plug for packages [instructions here](https://github.com/junegunn/vim-plug). Note, the vimrc should be good to go for no packages as well (for a quick and minimal install)
3. Run :PlugInstall, and you should be good to go!
4. I am currently using [fzf](https://github.com/junegunn/fzf.vim) for fuzzy file searching, although this is just a "nice to have" feature

## setup.sh
I've written two very minimal scripts to use when setting up the dotfiles: setup.sh and ubuntu\_setup.sh. The former is simply to use to link all the dotfiles to the home directory (note it will fail if files of the same name exist), the latter is used in an Ubuntu environment to install via apt-get zsh, tmux, and vim and also install Oh-My-Zsh and relevant zsh plugins.
