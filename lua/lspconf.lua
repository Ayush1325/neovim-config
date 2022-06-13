-- Useful Variables
local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

-- Setup LSP
require("nvim-lsp-installer").setup({
	automatic_installation = false,
	max_concurrent_installers = 12,
})
local lspconfig = require("lspconfig")

-- Rust Analyzer
lspconfig.rust_analyzer.setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "clippy",
				},
				diagnostics = {
					disabled = { "unlinked-file" },
				},
			},
			inlayHints = {
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
			},
		},
	},
})

-- Topl
lspconfig.taplo.setup({})

-- Clangd
lspconfig.clangd.setup({})

-- Cmake
-- require("lspconfig").cmake.setup({})

-- Lua
lspconfig.sumneko_lua.setup({})

-- Python
require("lspconfig").pyright.setup({})

-- Trouble Diagnostic
require("trouble").setup()
