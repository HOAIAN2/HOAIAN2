vim.wo.number = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.termguicolors = true

-- https://github.com/navarasu/onedark.nvim
require('onedark').setup {
    style = 'dark',
    transparent = true,
}

require('onedark').load()