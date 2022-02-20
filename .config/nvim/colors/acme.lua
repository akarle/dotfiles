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

vim.highlight.create('StatusLine', { ctermbg = 14, ctermfg = 0, cterm = "None" })
vim.highlight.create('StatusLineNC', { ctermbg = 12, ctermfg = 0, cterm = "None"  })
vim.highlight.create('VertSplit', { ctermbg = 12, ctermfg = 0, cterm = "None"  })
vim.highlight.create('Visual', { ctermbg = 11, ctermfg = 0, cterm = "None"  })
vim.highlight.create('LineNr', { ctermbg = 15, ctermfg = 8, cterm = "None"  })
