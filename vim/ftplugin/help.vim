" Some folding settings I like to use for writing Vim plugin documentation
" Won't work universally, but doesn't hurt to enable

" Simple fold function to fold until the next ===== or ------
function! DocTxtFoldExpr(lnum) abort
    if getline(a:lnum + 1) =~ '^\(=\+\|-\+\)$'
        return '<1'
    else
        return 1
    endif
endfunction

" Fold Text that prints number lines folded, a preview of what header it is,
" and the section name. Attempted to align nicely, but it breaks with tabs
" -    6 lines: ===== INTRO .....
" -   12 lines: ----- Example .....
function! DocTxtFoldText() abort
    let l = getline(v:foldstart)
    let lp1 = getline(v:foldstart + 1)
    let num_lines = v:foldend - v:foldstart + 1
    let lines_text = printf("%4s", num_lines) . ' lines:'
    let header_preview = l[0:5]
    let section_name = lp1[0:stridx(lp1, '   ')]
    if section_name !~ ' $'
        let section_name = section_name . ' '
    endif
    return join([v:folddashes, lines_text, header_preview, section_name], ' ')
endfunction

setlocal foldexpr=DocTxtFoldExpr(v:lnum)
setlocal foldtext=DocTxtFoldText()
setlocal foldmethod=expr
