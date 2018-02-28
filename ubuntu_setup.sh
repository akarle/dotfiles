#! /bin/bash

# install vim, tmux, zsh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install vim
sudo apt-get -y install zsh
sudo apt-get -y install tmux

# zsh setup!
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
