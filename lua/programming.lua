-- Useful Variables
local api = vim.api

-- Mason Setup
require("mason").setup()

--[[
LSP
--]]

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- nlspsettings is used for having local LSP configuration
require("nlspsettings").setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_dir = ".nlsp-settings",
	local_settings_root_markers = { ".git" },
	append_default_schemas = true,
	loader = "json",
})

-- On attach function for LSP
function on_attach(client, bufnr)
	local function buf_set_option(...)
		api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Default LSP configuration
local default_config = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Mason LSP config setup
mason_lspconfig.setup({
	ensure_installed = { "lua_ls" },
})

mason_lspconfig.setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup(default_config)
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})

-- Rust Analyzer
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
			},
		},
	},
	tools = {
		autoSetHints = true,
		on_initialized = function(x)
			if x == "ok" or x == "warning" then
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
})

-- Clangd Extensions
require("clangd_extensions").setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

-- Clangd
-- lspconfig.clangd.setup(default_config)

-- ccls
-- lspconfig.ccls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
--   init_options = {
--     index = {
--       threads = 0;
--     };
--     clang = {
--       excludeArgs = { "-frounding-math"} ;
--     };
--   }
-- })

-- Deno
lspconfig.denols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- Trouble Diagnostic
require("trouble").setup()

--[[
-- DAP Stuff
--]]
local dap, dapui = require("dap"), require("dapui")

-- DAP Config
dapui.setup({})

-- Open and Close DAP UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Launch Json
require("dap.ext.vscode").load_launchjs()

-- Enable Virtual Text
require("nvim-dap-virtual-text").setup()
