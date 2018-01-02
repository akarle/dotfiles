# After cloning dotfiles into ~/git/dotfiles
# this file sets up vimrc and tmux.conf

# Set up vimrc
VIMHOME=~/.vim
if [ ! -d $VIMHOME ]; then
    echo "Making ~/.vim"
    mkdir $VIMHOME
fi

ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/theme.vim ~/.vim/theme.vim
ln -s ~/git/dotfiles/plugins.vim ~/.vim/plugins.vim
ln -s ~/git/dotfiles/pluginsettings.vim ~/.vim/pluginsettings.vim
ln -s ~/git/dotfiles/keys.vim ~/.vim/keys.vim
