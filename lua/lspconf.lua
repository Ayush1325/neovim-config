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

-- LSP Signature
-- require("lsp_signature").setup()

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
-- local dap_install = require("dap-install")

-- dap_install.setup({
-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })
--
-- local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
--
-- for _, debugger in ipairs(dbg_list) do
-- 	dap_install.config(debugger)
-- end

-- Trouble Diagnostic
require("trouble").setup()
