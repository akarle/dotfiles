" A function to execute a command and return to the old position
" CREDIT: http://vimcasts.org/episodes/tidying-whitespace/
function! CMDPreserve(command)
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
