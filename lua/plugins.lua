local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- UI
	{ "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{
		"hoob3rt/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	"RRethy/nvim-base16",
	"kyazdani42/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"folke/which-key.nvim",

	-- External Deps Mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- LSP
	"neovim/nvim-lspconfig",
	"simrat39/rust-tools.nvim",
	"nvim-lua/plenary.nvim",
	"onsails/lspkind-nvim",
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"tamago324/nlsp-settings.nvim",
	"simrat39/symbols-outline.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"p00f/clangd_extensions.nvim",

	-- Nvim CMP Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	{
		"hrsh7th/nvim-cmp",
		dependencies = { { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-buffer" } },
	},
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"p00f/nvim-ts-rainbow",
	{ "romgrk/nvim-treesitter-context", dependencies = "nvim-treesitter/nvim-treesitter" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { { "nvim-telescope/telescope.nvim" } },
	},
	{ "nvim-telescope/telescope-dap.nvim", dependencies = "mfussenegger/nvim-dap" },
	"nvim-telescope/telescope-ui-select.nvim",
	"chip/telescope-software-licenses.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip",

	-- DAP Mode
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"theHamsta/nvim-dap-virtual-text",

	-- Git
	{ "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim" },
	"sindrets/diffview.nvim",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Programming
	"stevearc/overseer.nvim",

	-- Text Editing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Misc
	"Pocco81/auto-save.nvim",
	"AckslD/nvim-neoclip.lua",
	"jghauser/mkdir.nvim",

	-- Motion
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},
}

return require("lazy").setup(plugins, {})
