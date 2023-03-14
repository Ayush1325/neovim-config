-- Useful Variables
local cmd = vim.cmd
local lsp = vim.lsp
local api = vim.api

local lspconfig = require("lspconfig")
local nlspsettings = require("nlspsettings")

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

local default_config = {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Trouble Diagnostic
require("trouble").setup()

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
	-- dap = {
	-- 	adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	-- },
})

-- Clangd
lspconfig.clangd.setup(default_config)

-- Deno
lspconfig.denols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup(default_config)
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})
