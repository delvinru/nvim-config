-- plugin management
require("user.plugins")

-- basic settings
require("user.core.options")
require("user.core.keymaps")
require("user.core.colorscheme")

-- plugin settings
require("user.plugins.comment")
require("user.plugins.nvim-tree")
require("user.plugins.codestats")
require("user.plugins.lualine")
require("user.plugins.telescope")
require("user.plugins.cmp")
require("user.plugins.autopairs")
require("user.plugins.bufferline")
require("user.plugins.hacks")
require("user.plugins.gitsigns")
require("user.plugins.treesitter")

-- lsp plugins
require("user.lsp.mason")
require("user.lsp.lspsaga")
require("user.lsp.lspconfig")
require("user.lsp.null-ls")
