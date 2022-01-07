-- for short typings because i'm lazy :)
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Remap leader key
map('', ',', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- NERDTree bar
map('n', '<C-n>', ':NERDTreeToggle<CR>', opts)

-- Normal bindings for resize panes
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)
