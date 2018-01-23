" Syntastic Default Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E116'

" vimtex stuff
" Set pdf viewer to sim
let g:vimtex_view_method='skim'

"for airline status bar -- need to include font
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
