" ignore the wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" spell check!
setlocal spell spelllang=en_us

" soft word wrap should not break words
" NOTE: don't use listchars with this feature
setlocal linebreak
setlocal breakindent

" Break at 80
setlocal textwidth=80
