"=============================
"tab and line number stuff
"=============================
"line numbers on
set number
set relativenumber
"tab is really spaces
set expandtab
"4 spaces per tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set smartindent --> temp. turned off due to
"python # bug... theres a workaround somewhere
set autoindent
set smarttab

"search highlighting
set hlsearch

set rtp+=/usr/local/opt/fzf
filetype plugin indent on


" OTHER
" Link clipboard to mac
set clipboard=unnamed

"For security (modeline vulnerability)
set modelines=0

" Encoding
set encoding=utf-8

" Show whitespace with 'set: list' (disable: set: nolist)
set listchars=space:·,tab:>–,trail:~,eol:¬

" Source helper files
" Only load plugins if vim-plug installed!
if filereadable(expand("~/.vim/autoload/plug.vim"))
    source ~/.vim/plugins.vim
    source ~/.vim/pluginsettings.vim
endif
source ~/.vim/theme.vim
source ~/.vim/keys.vim
