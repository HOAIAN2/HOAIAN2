vim.wo.number = true
-- vim.opt.clipboard = 'unnamedplus'

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- https://github.com/navarasu/onedark.nvim
require('onedark').setup {
    style = 'dark',
    transparent = true,
}

require('onedark').load()
