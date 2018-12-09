" autoload/utils.vim -- utility functions to support vimrc
"
" See `:h autoload-functions` for explanation of autoloading and performance

" A function to execute a command and return to the old position
" CREDIT: http://vimcasts.org/episodes/tidying-whitespace/
function! utils#CMDPreserve(command) abort
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! utils#warn(msg) abort
    echohl WarningMsg
    echo 'vimrc: ' . a:msg
    echohl None
endfunction
