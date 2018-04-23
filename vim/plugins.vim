" Plugs will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Colorscheme
Plug 'morhetz/gruvbox'

" Extra syntax files
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'posva/vim-vue'

" Plug nerdtree for tree package explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Airline = status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fugitive = git for vim
Plug 'tpope/vim-fugitive'

" NERD Commenter = for comments
Plug 'scrooloose/nerdcommenter'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Syntastic for syntax checks
"Plug 'vim-syntastic/syntastic', { 'for': 'python' }

" todo task plugin
Plug 'irrationalistic/vim-tasks'

" Simple latex tools
Plug 'lervag/vimtex', { 'for': 'tex' }

" fzf -- fuzzy finder
"Plug 'junegunn/fzf.vim'

" surround for parens and such
Plug 'tpope/vim-surround'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
