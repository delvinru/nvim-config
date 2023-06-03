local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- reload neovim whenever you save this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    print("packer failed to init")
    return
end

return packer.startup(function(use)
    -- packer itself
    use("wbthomason/packer.nvim")
    -- cool stuff
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- window navigation
    use("szw/vim-maximizer")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- icons
    use("nvim-tree/nvim-web-devicons")

    -- cool airline in the bottom
    use("nvim-lualine/lualine.nvim")

    -- telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    use("hrsh7th/cmp-cmdline")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing & installing lsp server, linters & formatters
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")

    -- configuring lsp servers
    use("hrsh7th/cmp-nvim-lsp")
    use("glepnir/lspsaga.nvim")
    use("onsails/lspkind.nvim")

    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- autopair plugin
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })

    -- comment
    use("numToStr/Comment.nvim")

    -- treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })

    -- colorschemes
    use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
    use("LunarVim/darkplus.nvim")
    use("joshdick/onedark.vim")

    -- yara syntax
    use("s3rvac/vim-syntax-yara")

    -- bufferline
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")

    -- code-stats
    use("https://gitlab.com/code-stats/code-stats-vim.git")

    use("lewis6991/gitsigns.nvim")

    -- Autosetup stuff
    if packer_bootstrap then
        packer.sync()
    end
end)
