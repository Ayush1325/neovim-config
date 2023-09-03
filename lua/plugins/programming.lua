return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua",    -- optional
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true
	},
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("rust-tools").setup({
				standalone = false,
				capabilities = capabilities,
			})
		end
	},
	{
		"folke/neodev.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("neodev").setup({})
			require('lspconfig').lua_ls.setup({})
		end
	},
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require('lspconfig').clangd.setup({})
		end
	},
}
