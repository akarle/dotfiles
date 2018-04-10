"================================
"             THEME
"================================
"Syntax highlighting on
syntax on

" Set cursor line when in insert mode (to indicate insert mode)
if(has('autocmd'))
    autocmd InsertEnter,InsertLeave * set cul!
    autocmd BufNewFile,BufRead *.notes set filetype=markdown
endif

" COLORSCHEME
" use iterm profiles to determine background
if $ITERM_PROFILE=='light_background'
    set background=light
else
    set background=dark
endif

" if can use truecolor, do
if (has("termguicolors"))

    " load colorscheme if plugins installed
    if filereadable(expand("~/.vim/bundle/vim-one/colors/one.vim"))
        let g:one_allow_italics = 1
        set termguicolors
        colorscheme one
        " reverse one-dark's fold colors
        highlight Folded guibg=#282c34 guifg=#5c6370
    endif

    " Needed for termgui in tmux--&term begins w screen-...
    if &term =~# '^tmux'
        " Set the terminal foreground+background colors
        " See :h xterm-true-color
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif
