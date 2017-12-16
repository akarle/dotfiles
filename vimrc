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

" Colorscheme
Plugin 'rakr/vim-one'

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

" fzf -- fuzzy finder
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

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

" COLORSCHEME
" use iterm profiles to determin background
if $ITERM_PROFILE=='light_background'
    set background=light
else
    set background=dark
endif

" load colorscheme if plugins installed
if filereadable(expand("~/.vim/bundle/vim-one/colors/one.vim"))
    colorscheme one
endif

" if can use truecolor, do
if (has("termguicolors"))
    set termguicolors
endif

let g:airline_theme = 'onedark'

" Show whitespace with 'set: list' (disable: set: nolist)
set listchars=space:·,tab:>–,trail:~,eol:¬

" Syntastic Default Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E116'

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

"Map ctrl-p to fuzzy finder
nnoremap <C-p> :GFiles<CR>

" Link clipboard to mac
set clipboard=unnamed
