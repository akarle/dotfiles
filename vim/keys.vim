"================================
"        KEY MAPPINGS
"================================
" set leader to be spacebar
let mapleader = " "

"Map ctrl-i/j/k/h to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Map ctrl-p to toggle paste mode
nnoremap <C-p> :set paste!<CR>

" HTML autoclose tag
iabbrev </ </<C-X><C-O>

" Elim Whitespace (through regexp)
nmap _$ :call CMDPreserve("%s/\\s\\+$//e")<CR>

" save session
nnoremap <leader>s :mksession!<CR>

" edit in current buffer dir
nnoremap <leader>e :e %:h/
