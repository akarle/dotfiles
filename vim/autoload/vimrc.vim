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

" Searches all of project for word under cursor
function! vimrc#GitGrep(word) abort
    if s:InGitRepo()
        let raw = system('git grep -n ' . a:word)
        let matches = split(raw, '\n')
        let qfitems = []
        for m in matches
            let items = split(m, ':')
            " Rare case that we match a binary file
            if len(items) < 3
                continue
            endif
            let d = {
                        \'filename': items[0],
                        \'lnum': items[1],
                        \'text': join(items[2:], '')
                    \}

            let qfitems += [d]
        endfor
        call setqflist(qfitems, 'r')
    else
        call utils#warn("called GitGrepWordUnderCursor outside of git repo")
    endif
endfunction

function! vimrc#GitGrepWordUnderCursor() abort
    let word = substitute(expand('<cword>'), '#', '\\#', 'g')
    call vimrc#GitGrep(word)
endfunction

function! s:InGitRepo() abort
    if has('win64') || has('win32')
        let fsep = '\'
    else
        let fsep = '/'
    endif
    let dir_list = split(getcwd(), fsep)
    let running_path = ''
    for dir in dir_list
        let running_path = join([running_path, dir], fsep)
        if isdirectory(running_path . fsep . '.git')
            return 1
        endif
    endfor
    return 0
endfunction

function! vimrc#SetPasteAndPasteFromClipboard() abort
    set paste
    normal! "*p
    set nopaste
endfunction

function! vimrc#PerlDebugger() abort
    " Simple wrapper around term + syntax perl
    if has('nvim')
        terminal perl -de 'use Data::Dumper'
    else
        terminal ++curwin perl -de 'use Data::Dumper'
    end
    setlocal syntax=perl
endfunction
