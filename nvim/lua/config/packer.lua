vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}


	use {
		'ellisonleao/gruvbox.nvim',
		as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	}

	use('nvim-treesitter/nvim-treesitter',
		{ run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end, })
	use('mbbill/undotree')               -- History of File-Changes
	use('nvim-lualine/lualine.nvim')     -- Fancy statusline
	use('lukas-reineke/indent-blankline.nvim') -- Blankline indentationguides
    
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
			{ 'j-hui/fidget.nvim' },
			{ 'ziglang/zig.vim' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'saadparwaiz1/cmp_luasnip' }
		}
	}

    -- Debugging
    use{
        'mfussenegger/nvim-dap',
        config = function () end
    }

    use {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        opts = { handlers = {}}
    }

    use('machakann/vim-highlightedyank')
end)
