" set fold method to be indent based
" USAGE:
"   KEY: no longer use zf#j or zf/<str> to create folds
"        instead:
"   zc -- close a fold by indent (at cursor until end indent)
"   zo -- open a closed fold
setlocal foldmethod=indent

" Set the local :make command to run flake8
setlocal makeprg=flake8\ %
