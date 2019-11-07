" autoload/vimrc.vim -- functions to be called in vimrc
"
" See `:h autoload-functions` for explanation of autoloading and performance
function! vimrc#ToggleColorColumn() abort
    if &colorcolumn == ""
        if &textwidth > 0
            exe "set colorcolumn=" . &textwidth
        else
            set colorcolumn=80
        endif
    else
        set colorcolumn=""
    endif
endfunction

" A function to execute a command and return to the old position
" CREDIT: http://vimcasts.org/episodes/tidying-whitespace/
function! vimrc#CMDPreserve(command) abort
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
