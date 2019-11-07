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
