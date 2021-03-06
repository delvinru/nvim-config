local fn = vim.fn

-- Auto install stuff from official repo
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[ packadd packer.nvim ]]
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local packer = require('packer')

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'                                    -- manage packer itself
    use 'nvim-lua/plenary.nvim'                                     -- some popup stuff, idk
    use 'nvim-lua/popup.nvim'                                       -- same shit

    -- Autopair plugin
    use {
        'windwp/nvim-autopairs',
        setup = require('nvim-autopairs').setup()
    }

    -- Easily comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end,
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Nice airline in the bottom
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}

    -- Nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorschemes
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'LunarVim/darkplus.nvim'
    use 'joshdick/onedark.vim'

    -- Yara syntax
    use 's3rvac/vim-syntax-yara'

    -- cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'

    -- LSP config
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'                  -- Snippet engine
    use "rafamadriz/friendly-snippets"      -- A bunch of snippets

    -- Bufferline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'moll/vim-bbye'

    -- CodeStats
    use 'https://gitlab.com/code-stats/code-stats-vim.git'

    -- Autosetup stuff
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
