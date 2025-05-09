-- init.lua ; my nvim config
vim.cmd [[colorscheme default]]

-- Line numbers essential for pairing
vim.opt.number = true

-- Persistent undo files in ~/.local/share/nvim/undo
vim.opt.undofile = true

-- Characters to show non-visible whitespace via `:set list`
vim.opt.listchars = "tab:>-,trail:~,eol:$,space:."

-- In general, softwrap at word boundaries
vim.opt.linebreak = true

-- Space and Tab settings for various filetypes
vim.cmd [[autocmd FileType markdown        setlocal et sw=4 sts=4 tw=80 ]]
vim.cmd [[autocmd FileType python          setlocal et sw=4 sts=4]]
vim.cmd [[autocmd FileType sql             setlocal et sw=4 sts=4]]
vim.cmd [[autocmd FileType yaml            setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType javascript      setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType typescript      setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType typescriptreact setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType scheme          setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType html            setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType css             setlocal et sw=2 sts=2]]
vim.cmd [[autocmd FileType kotlin          setlocal et sw=2 sts=2]]
vim.cmd [[autocmd BufRead,BufNewFile *.jsx set filetype=javascript]]


-- Switch between windows with Ctrl-h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Fast git-grepping
vim.cmd [[let mapleader = " "]]
vim.api.nvim_set_keymap("n", "<leader>G", ":Ggrep! <cword><CR>:copen<CR>", { noremap = true })

-- Lastly, source a local config, if it exists
vim.cmd [[runtime! local.lua]]
