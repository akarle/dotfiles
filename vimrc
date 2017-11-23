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

"===============================
"          PLUGINS
"===============================
"Don't try to work with vi
set nocompatible

"Use vundle for plugins!
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin nerdtree for tree package explorer
Plugin 'scrooloose/nerdtree.git'

" Airline = status bar for vime
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fugitive = git for vim
Plugin 'tpope/vim-fugitive'

" NERD Commenter = for comments
Plugin 'scrooloose/nerdcommenter'

" Better syntax highlighting for python
"Plugin 'hdima/python-syntax'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Syntastic for syntax checks
Plugin 'vim-syntastic/syntastic'

" todo task plugin
Plugin 'irrationalistic/vim-tasks'

" Simple latex tools
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"================================
"           THEME + OTHER
"================================
"for airline status bar -- need to include font
let g:airline_powerline_fonts = 1

"For security (modeline vulnerability)
set modelines=0

"Syntax highlighting on
syntax on

" Encoding
set encoding=utf-8

"colorscheme
if $ITERM_PROFILE=='light_background'
    set background=light
else
    set background=dark
endif

colorscheme one
set termguicolors
let g:airline_theme = 'onedark'

" Show whitespace with 'set: list' (disable: set: nolist)
set listchars=space:·,tab:>–,trail:~,eol:¬
set list

" Syntastic Default Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']

" vimtex stuff
" Set pdf viewer to sim
let g:vimtex_view_method='skim'

"================================
"        NEW MAPPINGS
"================================
"Map 'jk' to ESC (its wonderful)
inoremap jk <ESC>

"Map ctrl-i/j/k/h to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Link clipboard to mac
set clipboard=unnamed
