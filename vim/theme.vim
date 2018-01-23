"================================
"             THEME
"================================
"Syntax highlighting on
syntax on

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
