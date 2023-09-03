return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true
	},
	{
		"neovim/nvim-lspconfig",
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
}
