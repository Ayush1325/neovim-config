-- Useful Variables
local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

local lspconfig = require("lspconfig")
local nlspsettings = require("nlspsettings")
local lsp_installer = require("nvim-lsp-installer")

-- nlspsettings config
nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers = { ".git" },
	append_default_schemas = true,
	loader = "json",
})

function on_attach(client, bufnr)
	local function buf_set_option(...)
		api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup LSP
lsp_installer.setup({
	automatic_installation = false,
	max_concurrent_installers = 12,
	on_attach = on_attach,
})

-- Trouble Diagnostic
require("trouble").setup()

-- Rust Analyzer
-- lspconfig.rust_analyzer.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			assist = {
-- 				importEnforceGranularity = true,
-- 				importPrefix = "crate",
-- 			},
-- 			cargo = {
-- 				features = "all",
-- 			},
-- 			proc_macro = {
-- 				enable = true,
-- 			},
-- 			checkOnSave = {
-- 				allTargets = true,
-- 			},
-- 			standalone = true,
-- 			inlayHints = { locationLinks = false },
-- 		},
-- 	},
-- })
require("rust-tools").setup({
	server = {
		on_attach = on_attach,
		standalone = false,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					features = "all",
				},
				proc_macro = {
					enable = true,
				},
				checkOnSave = {
					allTargets = true,
				},
				-- inlayHints = { locationLinks = false },
			},
		},
	},
	tools = {
		autoSetHints = true,
		on_initialized = function(x)
			if x == "ok" or x == "warning" then
				-- set inlay hints
				require("rust-tools.inlay_hints").set_inlay_hints()
			end
		end,
		inlay_hints = {
			auto = true,
			only_current_line = false,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			highlight = "Comment",
		},
	},
	-- dap = {
	-- 	adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	-- },
})

-- Topl
lspconfig.taplo.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Clangd
lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Cmake
-- require("lspconfig").cmake.setup({})

-- Lua
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Python
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Json
lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Html
lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Symbols
require("gitsigns").setup()
