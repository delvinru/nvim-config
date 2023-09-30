-- for short typings because i'm lazy :)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap leader key
map('', ',', '<Nop>', opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- NvimTree bar
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- Disable highlight
map('n', '<leader><Space>', ':nohlsearch<CR>', opts)

-- Better navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Normal bindings for resize panes
map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)
map('n', '<C-Left>', ':vertical resize +2<CR>', opts)
map('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Bufferline maps
map('n', 'H', ':BufferLineCyclePrev<CR>', opts)
map('n', 'L', ':BufferLineCycleNext<CR>', opts)
map('n', 'X', ':Bdelete! %<CR>', opts)

-- Easy life
map('n', 'S', ':%s//g<Left><Left>', { noremap = true })
map('i', 'jk', '<esc>', opts)

-- Formatter
map('n', 'for', ':lua vim.lsp.buf.format()<CR>', opts)

-- Telescope
map('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>g', '<cmd>Telescope live_grep<CR>', opts)

-- pane stuff
map('n', '<leader>v', '<cmd>vsplit<cr>', opts)
map('n', '<leader>s', '<cmd>split<cr>', opts)
map('n', '<leader>e', '<C-w>=', opts)               -- make split windows equal width
map('n', '<leader>m', ':MaximizerToggle<CR>', opts) -- maximize window
