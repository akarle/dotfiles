" autoload/vimrc.vim -- functions to be called in vimrc
"
" See `:h autoload-functions` for explanation of autoloading and performance
function! vimrc#ToggleColorColumn() abort
    if &colorcolumn == ""
        set colorcolumn=80
    else
        set colorcolumn=""
    endif
endfunction

function! vimrc#SetPasteAndPasteFromClipboard() abort
    set paste
    normal! "+p
    set nopaste
endfunction
