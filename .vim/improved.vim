" .vim/improved.vim -- putting the IM in VIM

" GENERAL EDITOR SETTINGS {{{
set number                      " Line numbers
set undodir=~/.vim/undo/        " Persistent undo
set undofile                    " Do indeed create said files
set undolevels=1000             " Max # changes that can be undone
set undoreload=10000            " Saves undofile on reload (:e) if < 10k LOC
set backupdir=~/.vim/swp,.      " Backup files in ~/.vim/swp
set directory=~/.vim/swp,.      " Swap files in ~/.vim/swp
" }}}

" PLUGIN RELATED SETTINGS {{{
" If using Dirvish, don't use netrw
if isdirectory(expand('~/.vim/pack/plugins/start/vim-dirvish/plugin'))
    " Dirvish #137
    let loaded_netrwPlugin = 1
else
    let g:netrw_banner=0                " disable banner
    let g:netrw_liststyle=1             " details view
endif

let g:ale_set_loclist = 1
let g:ale_python_flake8_options = '--ignore "E501,E302"'
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'] }
let g:ale_fixers = {'javascript': ['prettier'], 'python': ['black'] }
let g:ale_fix_on_save = 1
" }}}

" COLORSCHEME {{{
" Only gruv if you can handle it
" NOTE: for initial check, check $TERM, not &term, as nvim has &term=nvim
set background=dark
if (($TERM =~# '256color' && has("termguicolors")) || has('gui_running')) &&
    \ filereadable(expand("~/.vim/pack/mine/start/gruvbox/colors/gruvbox.vim"))

    set termguicolors
    colorscheme gruvbox

    " See :h xterm-true-color for tmux+termguicolors
    if &term =~# '^\(tmux\|st\|screen\)'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    augroup CurLineToggle
        autocmd!
        autocmd InsertEnter,InsertLeave * set cul!
    augroup END
endif
" }}}

" KEY MAPPINGS {{{
" set leader to be spacebar
let mapleader = " "

"Map ctrl-i/j/k/h to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Paste from clipboard without any formatting issues
nnoremap <C-p> :set paste \| put + \| set nopaste<CR>

" Clear trailing whitespace (through regexp)
nnoremap <leader><space> :%s/\s\+$//e<CR>

" edit in current buffer dir
nnoremap <leader>e :e %:h/
nnoremap <leader>v :vsp %:h/
nnoremap <leader>s :sp %:h/

" toggle color column (to ensure short lines)
nnoremap <expr> <leader>C vimrc#ToggleColorColumn()

" Clear that highlight!
nnoremap <BS> :nohlsearch<CR>

" Get greppin quick! --> search word under cursor (escape # for VimL autoload)
nnoremap <silent> <leader>G :Ggrep! <cword><CR>:copen<CR>

" Toggle whitespace
nnoremap <leader>w :set list!<CR>

" From defaults.vim: breaks the undo chain so we can undo <C-U>
inoremap <C-U> <C-G>u<C-U>
" }}}

" COMMANDS {{{
command! CD exe 'cd ' . expand('%:h')
" }}}

" Load optional config (in ~/.vim)
runtime! .vimrc.local
