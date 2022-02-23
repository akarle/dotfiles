-- init.lua ; my nvim config
vim.cmd [[colorscheme acme]]

-- Persistent undo files in ~/.local/share/nvim/undo
vim.opt.undofile = true

-- Switch between windows with Ctrl-h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
