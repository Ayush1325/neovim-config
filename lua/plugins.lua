return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- UI
	use({ "glepnir/dashboard-nvim" })
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("Mofiqul/vscode.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/nvim-lsp-installer",
	})
	use({ "simrat39/rust-tools.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"ray-x/lsp_signature.nvim",
	})
	use("onsails/lspkind-nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("liuchengxu/vista.vim")

	-- Nvim CMP Completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"hrsh7th/nvim-cmp",
		requires = { { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-buffer" } },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	use("p00f/nvim-ts-rainbow")
	use({ "romgrk/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		requires = { { "nvim-telescope/telescope.nvim" } },
	})
	use({ "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" })

	-- Snippets
	use("L3MON4D3/LuaSnip")

	-- DAP Mode
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("Pocco81/DAPInstall.nvim")

	-- Git
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("sindrets/diffview.nvim")
	use("airblade/vim-gitgutter")

	-- Programming
	use("ahmedkhalf/project.nvim")
	use("mhartington/formatter.nvim")
	use("peterhoeg/vim-qml")

	-- Text Editing
	use("beauwilliams/focus.nvim")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")

	-- Misc
	use("Pocco81/AutoSave.nvim")
	use("AckslD/nvim-neoclip.lua")

	-- Motion
	use("phaazon/hop.nvim")

	-- Markdown
	use("dhruvasagar/vim-table-mode")
end)
