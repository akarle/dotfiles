"================================
"             THEME
"================================
"for airline status bar -- need to include font
if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
    let g:airline_powerline_fonts = 1
endif

if filereadable(expand("~/.vim/bundle/vim-airline-themes/plugin/airline-themes.vim"))
    let g:airline_theme = 'onedark'
endif

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
