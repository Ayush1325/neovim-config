-- Useful Variables
local cmd = vim.cmd
local lsp = vim.lsp

-- Setup LSP
local lsp_installer = require("nvim-lsp-installer")
local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
	}
	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

-- LSP Signature
require("lsp_signature").setup()

-- Rust Analyzer
-- require("lspconfig").rust_analyzer.setup({})

-- Topl
-- require("lspconfig").taplo.setup({})

-- Clangd
-- require("lspconfig").clangd.setup({})

-- Cmake
-- require("lspconfig").cmake.setup({})

-- Lua
-- require("lspconfig").sumneko_lua.setup({})

-- LSP Saga
-- require("lspsaga").init_lsp_saga()

-- DAP Config
require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

-- Telescope Integration
require("telescope").load_extension("dap")

-- Load all installed debuggers
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

-- Trouble Diagnostic
require("trouble").setup()
