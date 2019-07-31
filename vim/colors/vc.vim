" colors/vc.vim
"
" An adaptation of the default colorscheme for the Linux Virtual Console
" (also just my preferred 'default' should there be no gruvbox installed)
"
" Preferred Setup:
" ================
"   - Vim 8.1 (NeoVim insists on setting &t_Co to 256 / dropped t_XX settings)
"   - &t_Co == 8
"   - TERM=linux (default VC) or TERM=tmux/screen
"   - Base 8-color pallete from gruvbox
"   - bg=light
hi! StatusLine   cterm=NONE ctermfg=0 ctermbg=7
hi! StatusLineNC cterm=NONE ctermfg=0 ctermbg=7
hi! Folded cterm=NONE ctermfg=3 ctermbg=0
hi! LineNr cterm=NONE ctermfg=7 ctermbg=0
