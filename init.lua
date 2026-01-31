vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"

-- Example: Set 4 spaces for tabs and indentation in init.lua
vim.opt.tabstop = 4      -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for while performing editing operations

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>lg', ':terminal lazygit<CR>', { desc = 'Save file' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>cd', vim.cmd.Ex, { desc = 'Explore' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format Document' })

vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/saghen/blink.cmp'
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('tokyonight').setup({
    transparent = true,
    style = "night",
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})

vim.cmd("colorscheme tokyonight")

require('lualine').setup({
    theme = "tokyonight",
})

require('blink.cmp').setup({
    fuzzy = { implementation = "prefer_rust" }
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'tsx', 'javascript', 'typescript', 'python' },
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.lsp.enable('pyright')
vim.lsp.enable('eslint')
vim.lsp.enable('ts_ls')
require("nvim-autopairs").setup({})

vim.lsp.config('lua_ls', { settings = { diagnostics = { globals = { "vim" } } } })
vim.lsp.enable('lua_ls')
