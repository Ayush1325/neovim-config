return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "glepnir/dashboard-nvim" })

	use("neovim/nvim-lspconfig")
	use({
		"williamboman/nvim-lsp-installer",
	})
	use({ "simrat39/rust-tools.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"ray-x/lsp_signature.nvim",
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-cmdline")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
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
	use("kyazdani42/nvim-web-devicons")
	use({
		"hrsh7th/nvim-cmp",
		requires = { { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-buffer" } },
	})
	use("L3MON4D3/LuaSnip")
	use({
		"jghauser/mkdir.nvim",
		config = function()
			require("mkdir")
		end,
	})
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("Pocco81/DAPInstall.nvim")
	use({ "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" })
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- use("famiu/feline.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("sindrets/diffview.nvim")
	use("p00f/nvim-ts-rainbow")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("ahmedkhalf/project.nvim")
	use("beauwilliams/focus.nvim")
	use({ "dracula/vim", as = "dracula" })
	use("mhartington/formatter.nvim")
	use("windwp/nvim-autopairs")
	use("Pocco81/AutoSave.nvim")
	use({ "romgrk/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter" })
	use("AckslD/nvim-neoclip.lua")
	use("peterhoeg/vim-qml")
end)
