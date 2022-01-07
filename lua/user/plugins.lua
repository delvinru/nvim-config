local fn = vim.fn

-- Auto install stuff from official repo
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
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
		config = function()
			require('lualine').setup()
		end,
	}

    -- Colorschemes
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}


    -- cmp plugins
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- LSP config
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- Autosetup stuff
    if packer_bootstrap then
        packer.sync()
    end
end)
