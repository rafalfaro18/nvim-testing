vim.opt.number = true 
vim.opt.relativenumber = true 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
})

require('tokyonight').setup({
    transparent = true,
    style = "night",
    styles = {
	sidebars = "transparent",
	floats = "transparent",
    },
})

vim.cmd("colorscheme tokyonight")
