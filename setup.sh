# After cloning dotfiles into ~/git/dotfiles
# this file sets up vimrc and tmux.conf

# Set up vimrc
VIMHOME=~/.vim
GITVIM=~/git/dotfiles/vim
if [ ! -d $VIMHOME ]; then
    echo "Making ~/.vim"
    mkdir $VIMHOME
fi

ln -s $GITVIM/vimrc ~/.vimrc
ln -s $GITVIM/theme.vim $VIMHOME/theme.vim
ln -s $GITVIM/plugins.vim $VIMHOME/plugins.vim
ln -s $GITVIM/pluginsettings.vim $VIMHOME/pluginsettings.vim
ln -s $GITVIM/keys.vim $VIMHOME/keys.vim

# filetype plugins
FTPLUGDIR=$VIMHOME/ftplugin
if [ ! -d $FTPLUGDIR ]; then
    mkdir $FTPLUGDIR
fi

ln -s $GITVIM/ftplugin/tex.vim $FTPLUGDIR/tex.vim

# Link tmux conf
ln -s ~/git/dotfiles/tmux.conf ~/.tmux.conf

# Link zshrc
ln -s ~/git/dotfiles/zshrc ~/.zshrc
