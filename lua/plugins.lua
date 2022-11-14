local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

ensure_packer()
local packer = require('packer')

packer.init {
	max_jobs = 10,
}

return packer.startup(function(use)
	-- Neovim helper function libary, required for some plugins
	use 'nvim-lua/plenary.nvim'

	-- Theme Manager
	use 'rktjmp/lush.nvim'

	-- Colorizer
	use {
		'norcalli/nvim-colorizer.lua',
		config = function ()
			require('colorizer').setup()
		end
	}

	-- Common devicons
	use {
		'nvim-tree/nvim-web-devicons',
		config = function()
			require('nvim-web-devicons').setup({
				color_icons = true,
			})
		end
	}

	-- Displays indents like spaces or tabs
	use {
		"lukas-reineke/indent-blankline.nvim",
		event = 'BufEnter',
		config = function()
			require('config.indent-blankline')
		end
	}

	-- Syntax Highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/playground'
		},
    config = function()
			require("config.treesitter")
		end,
	}

	-- Comment/Uncomment
	use {
    'numToStr/Comment.nvim',
		config = function ()
			require('Comment').setup()
		end
	}

	-- Motion movement
	use {
		'ggandor/leap.nvim',
		config = function ()
			require('leap').add_default_mappings()
			require('leap').opts.safe_labels = {}
		end
	}

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end
	}

	-- Autotags
	use {
		'windwp/nvim-ts-autotag',
		after = 'nvim-treesitter',
	}

	-- Dashboard
	use {
		'glepnir/dashboard-nvim',
		config = function()
			require('config.dashboard')
		end
	}

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		config = function ()
			require('config.telescope')
		end
	}

	-- Statusbar
	use {
		'nvim-lualine/lualine.nvim',
		config = function()
			require('config.lualine')
		end
	}

	-- Bufferline
	use 'famiu/bufdelete.nvim'
	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		config = function()
			require('config.bufferline')
		end
	}

	-- File Tree
	use {
		"nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
			"MunifTanjim/nui.nvim",
    },
		config = function()
			require('config.neotree')
		end
  }

	-- Terminal
	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function ()
			require('config.term')
		end
	}

	-- Snippet Engine
	use { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }

	-- LSP Icons
	use {
		'onsails/lspkind.nvim',
		config = function ()
			require('config.lspkind')
		end
	}

	-- Completion Engine
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			require('config.cmp')
		end
	}

	-- LSP Setup, LSP/DAP/Linter/Formatter Installer
	use {
    'williamboman/mason.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'jayp0521/mason-null-ls.nvim',
		},
		config = function()
			require('config.lsp.setup')
		end
	}

	-- LSP Outline
	use {
		'stevearc/aerial.nvim',
		config = function()
			require('config.aerial')
		end
	}

end)

