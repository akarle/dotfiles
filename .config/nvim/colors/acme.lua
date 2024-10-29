-- acme.vim -- acme-inspired colors
--
-- currently only tested on st(1) with the following colorname[]:
--
--    /* 8 normal colors */
--    "#000000",
--    "#ad4f4f",
--    "#468747",
--    "#8f7734",
--    "#268bd2",
--    "#888aca",
--    "#6aa7a8",
--    "#f3f3d3",
--    
--    /* 8 bright colors */
--    "#878781",
--    "#ffdddd",
--    "#ebffeb",
--    "#edeea5",
--    "#ebffff",
--    "#96d197",
--    "#a1eeed",
--    "#ffffeb",

vim.cmd [[syntax off]]
vim.opt.background = 'light'

vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg = 14, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { ctermbg = 12, ctermfg = 0  })
vim.api.nvim_set_hl(0, 'TabLineFill', { ctermbg = 12, ctermfg = 0  })
vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg = 15, ctermfg = 14  })
vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 11, ctermfg = 0  })
vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 15, ctermfg = 8  })
vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 15, ctermfg = 8  })
vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 15, ctermfg = 8  })
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 10, ctermfg = 0  })
vim.api.nvim_set_hl(0, 'PmenuSel', { ctermbg = 11, ctermfg = 0  })

-- Even though we have syn off, we need to set these for LSP
vim.api.nvim_set_hl(0, 'Statement', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Identifier', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Type', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'PreProc', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Constant', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Comment', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Special', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 15, ctermfg = 0 })
vim.api.nvim_set_hl(0, 'Directory', { ctermbg = 15, ctermfg = 0 })
