"================================
"        KEY MAPPINGS
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

" HTML autoclose tag
iabbrev </ </<C-X><C-O>
