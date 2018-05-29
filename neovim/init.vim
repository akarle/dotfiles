" init.vim -- the config for neovim
"
" Used for specific neovim customization!

" First, just source the regular Vim stuff
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" Custom mappings
tnoremap <C-h> <C-\><C-n><C-w>hA
tnoremap <C-j> <C-\><C-n><C-w>jA
tnoremap <C-k> <C-\><C-n><C-w>kA
tnoremap <C-l> <C-\><C-n><C-w>lA
