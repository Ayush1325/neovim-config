return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- UI
		use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("RRethy/nvim-base16")
		use("kyazdani42/nvim-web-devicons")
		use("lukas-reineke/indent-blankline.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("folke/which-key.nvim")

		-- LSP
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		use("simrat39/rust-tools.nvim")
		use("nvim-lua/plenary.nvim")
		use("onsails/lspkind-nvim")
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("tamago324/nlsp-settings.nvim")
		use("simrat39/symbols-outline.nvim")

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
		use("hrsh7th/cmp-nvim-lsp-signature-help")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
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
		use("nvim-telescope/telescope-ui-select.nvim")
		use("chip/telescope-software-licenses.nvim")

		-- Snippets
		use("L3MON4D3/LuaSnip")

		-- DAP Mode
		use("mfussenegger/nvim-dap")
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use("mfussenegger/nvim-dap-python")
		use("theHamsta/nvim-dap-virtual-text")

		-- Git
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use("sindrets/diffview.nvim")
		use("lewis6991/gitsigns.nvim")

		-- Programming
		use("ahmedkhalf/project.nvim")
		use("mhartington/formatter.nvim")
		use("peterhoeg/vim-qml")

		-- Text Editing
		use("windwp/nvim-autopairs")
		use("kylechui/nvim-surround")

		-- Misc
		use("Pocco81/auto-save.nvim")
		use("AckslD/nvim-neoclip.lua")
		use("jghauser/mkdir.nvim")

		-- Motion
		use("phaazon/hop.nvim")
	end,
	config = {
		max_jobs = nil,
		git = {
			depth = 1,
			clone_timeout = 2 * 60,
		},
	},
})
