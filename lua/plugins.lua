local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local _ = ensure_packer()

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

		-- External Deps Mason
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- LSP
		use("neovim/nvim-lspconfig")
		use("simrat39/rust-tools.nvim")
		use("nvim-lua/plenary.nvim")
		use("onsails/lspkind-nvim")
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("tamago324/nlsp-settings.nvim")
		use("simrat39/symbols-outline.nvim")
		use("jose-elias-alvarez/null-ls.nvim")
    use("p00f/clangd_extensions.nvim")

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
		use("theHamsta/nvim-dap-virtual-text")

		-- Git
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use("sindrets/diffview.nvim")
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- Programming
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		})

		-- Text Editing
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})
		use({
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({})
			end,
		})

		-- Misc
		use("Pocco81/auto-save.nvim")
		use("AckslD/nvim-neoclip.lua")
		use("jghauser/mkdir.nvim")

		-- Motion
		use({
			"phaazon/hop.nvim",
			config = function()
				require("hop").setup()
			end,
		})
	end,
	config = {
		max_jobs = nil,
		git = {
			depth = 1,
			clone_timeout = 2 * 60,
		},
	},
})
