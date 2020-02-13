" init.vim -- the config for neovim
"
" Used for specific neovim customization!

" First, just source the regular Vim stuff
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

if filereadable(expand("~/.vimrc"))
    " On some machines, I prefer to use a ~/.vimrc
    source ~/.vimrc
else
    source ~/.vim/vimrc
endif

" no numbers in terminal
autocmd TermOpen * setlocal nonumber

" incrementally show substitutions!
set inccommand=nosplit
