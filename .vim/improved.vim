" .vim/improved.vim -- putting the IM in VIM

" GENERAL EDITOR SETTINGS {{{
" Try to be platform agnostic:
if has('win64') || has('win32')
    let s:vimdir = expand($HOME . '/vimfiles')
else
    let s:vimdir = expand($HOME . '/.vim')
endif

" Line numbers on -- helpful for debugging, not needed in `vi`
set number

" Faster grepping! (use ripgrep if available for :grep and :FZF)
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
endif

" Persistent undo
if has('persistent_undo') && isdirectory(s:vimdir . '/undo')
    exe 'set undodir='.s:vimdir.'/undo/'
    set undofile                    " Do indeed create said files
    set undolevels=1000             " Max # changes that can be undone
    set undoreload=10000            " Saves undofile on reload (:e) if < 10k LOC
endif

" Use ~/.vim/swp if avail (else .) for backup and swp files respectively
exe 'set backupdir='.s:vimdir.'/swp,.'
exe 'set directory='.s:vimdir.'/swp,.'
" }}}

" PLUGIN RELATED SETTINGS {{{
" Don't use powerline font in airline (not neces. installed)
let g:airline_powerline_fonts = 0

" This enables folding in the built in markdown ftplugin
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['sh', 'bash=sh', 'perl', 'python', 'vim']

" If using Dirvish, don't use netrw
if isdirectory(s:vimdir . '/pack/plugins/start/vim-dirvish/plugin')
    " Dirvish #137
    let loaded_netrwPlugin = 1
else
    let g:netrw_banner=0                " disable banner
    let g:netrw_liststyle=1             " details view
endif

" Mojolicious syntax highlighting for Mojolicious::Lite
let mojo_highlight_data = 1

" git-messenger with popup windows is cool!
let g:git_messenger_always_into_popup = v:true

let g:ale_set_loclist = 1
let g:ale_python_flake8_options = '--ignore "E501,E302"'
" }}}

" COLORSCHEME {{{
" Only gruv if you can handle it
" NOTE: for initial check, check $TERM, not &term, as nvim has &term=nvim
if (($TERM =~# '256color' && has("termguicolors")) || has('gui_running')) &&
    \ filereadable(s:vimdir . "/pack/mine/start/gruvbox/colors/gruvbox.vim")

    set termguicolors
    colorscheme gruvbox

    " See :h xterm-true-color for tmux+termguicolors
    if &term =~# '^\(tmux\|st\|screen\)'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    set background=dark

    augroup CurLineToggle
        autocmd!
        autocmd InsertEnter,InsertLeave * set cul!
    augroup END
else
    " Can't handle the gruv
    set background=light
    colorscheme vc
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
nnoremap <leader><space> :call vimrc#CMDPreserve("%s/\\s\\+$//e")<CR>

" edit in current buffer dir
nnoremap <leader>e :e %:h/
nnoremap <leader>v :vsp %:h/
nnoremap <leader>s :sp %:h/

" toggle color column (to ensure short lines)
nnoremap <expr> <leader>C vimrc#ToggleColorColumn()

" 2 space / 4 space toggle
nnoremap <leader>2 :setlocal softtabstop=2 shiftwidth=2<CR>
nnoremap <leader>4 :setlocal softtabstop=4 shiftwidth=4<CR>

" Clear that highlight!
nnoremap <BS> :nohlsearch<CR>

" Get greppin quick! --> search word under cursor (escape # for VimL autoload)
nnoremap <leader>g :exe "grep " . substitute(expand('<cword>'), '#', '\\#', 'g')<CR>
nnoremap <silent> <leader>G :Ggrep! <cword><CR>:copen<CR>

" Toggle whitespace
nnoremap <leader>w :set list!<CR>

" Yank entire file
nnoremap <leader>y :0,$y +<CR>

" Edit vimrc
nnoremap <leader>V :edit $HOME/.vim/vimrc<CR>

" From defaults.vim: breaks the undo chain so we can undo <C-U>
inoremap <C-U> <C-G>u<C-U>
" }}}

" COMMANDS {{{
command! CD exe 'cd ' . expand('%:h')
" }}}

" Load optional config (in ~/.vim)
runtime! .vimrc.local

" vim:fdm=marker:sts=4:sw=4
