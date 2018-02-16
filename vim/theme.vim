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

    " Needed for termgui in tmux--&term begins w screen-...
    if &term =~# '^screen'
        " Set the terminal foreground+background colors
        " See :h xterm-true-color
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif
