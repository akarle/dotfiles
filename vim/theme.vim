"================================
"             THEME
"================================
"Syntax highlighting on
syntax on

" Set cursor line when in insert mode (to indicate insert mode)
if(has('autocmd'))
    augroup MyCustomAucmds
        " removes all autocmds from this group (needed when re-sourcing)
        autocmd!

        autocmd InsertEnter,InsertLeave * set cul!
        autocmd BufNewFile,BufRead *.notes set filetype=markdown
    augroup END  " goes back to default augroup
endif

" COLORSCHEME
" if can use truecolor, do
if (has("termguicolors"))
    " load colorscheme if plugins installed
    if filereadable(expand("~/.vim/bundle/gruvbox/colors/gruvbox.vim"))
        let g:gruvbox_italic = 1
        set termguicolors
        colorscheme gruvbox
        " make pythonSelf red not grey
        highlight link pythonSelf GruvboxBlue
    endif

    " Needed for termgui in tmux--&term begins w screen-...
    if &term =~# '^tmux'
        " Set the terminal foreground+background colors
        " See :h xterm-true-color
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

set background=dark  " seems to need to be after gruvbox


" Allow cursor to change shape
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode/42118416#42118416
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
