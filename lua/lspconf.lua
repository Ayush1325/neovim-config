-- Useful Variables
local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Setup LSP
require("nvim-lsp-installer").setup({
	automatic_installation = false,
	max_concurrent_installers = 12,
})
local lspconfig = require("lspconfig")

-- Rust Analyzer
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importEnforceGranularity = true,
				importPrefix = "crate",
			},
			cargo = {
				features = "all",
				target = "x86_64-unknown-uefi",
			},
			proc_macro = {
				enable = true,
			},
			checkOnSave = {
				allTargets = true,
			},
			standalone = true,
		},
	},
})

-- Topl
lspconfig.taplo.setup({
	capabilities = capabilities,
})

-- Clangd
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- Cmake
-- require("lspconfig").cmake.setup({})

-- Lua
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
	capabilities = capabilities,
})

-- Json
lspconfig.jsonls.setup({
	capabilities = capabilities,
})

-- Trouble Diagnostic
require("trouble").setup()

-- nlsp
local nlspsettings = require("nlspsettings")

nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers = { ".git" },
	append_default_schemas = true,
	loader = "json",
})
