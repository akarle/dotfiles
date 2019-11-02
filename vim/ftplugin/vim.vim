" Custom folding by expression to fold markers and functions

let b:viml_fold_markers = split(&foldmarker, ',')

function! VimLFoldByFunctionAndMarker(lnum) abort
    let l = getline(a:lnum)
    if l =~ '^function'
        return 'a1'
    elseif l =~ '^endfunction'
        return 's1'
    elseif l =~ b:viml_fold_markers[0]
        return 'a1'
    elseif l =~ b:viml_fold_markers[1]
        return 's1'
    else
        return '='
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=VimLFoldByFunctionAndMarker(v:lnum)
