vim.opt.relativenumber = true 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
