" init.vim -- the config for neovim
"
" Used for specific neovim customization!

" First, just source the regular Vim stuff
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vim/vimrc

" no numbers in terminal
autocmd TermOpen * setlocal nonumber

" incrementally show substitutions!
set inccommand=nosplit
