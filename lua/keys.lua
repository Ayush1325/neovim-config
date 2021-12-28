-- Useful Variables
local g = vim.g

-- Leader Key
g.mapleader = " "

-- Useful Functions
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Which Keys
local wk = require("which-key")
wk.register({
	f = {
		name = "Files",
		f = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "Files Browser" },
		p = { ":Telescope projects<CR>", "Projects" },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
	},

	b = {
		name = "Buffers",
		b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List Buffers" },
		c = { ":bd<CR>", "Close Buffer" },
	},

	h = {
		name = "Help",
		t = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
	},

	l = {
		name = "LSP",
		i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "LSP Implementations" },
		d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "LSP Definations" },
		c = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", "Code Action" },
		r = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "LSP Rename" },
		l = {
			name = "List",
			r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "LSP References" },
			s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "LSP Document Symbols" },
			w = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "LSP Workspace Symbols" },
		},
	},

	n = {
		name = "Nvim Tree",
		t = { ":NvimTreeToggle<CR>", "Nvim Tree Toggle" },
		r = { ":NvimTreeRefresh<CR>", "Nvim Tree Refresh" },
		f = { ":NvimTreeFindFile<CR>", "Nvim Tree Find Files" },
	},

	w = {
		name = "Window",
		s = {
			name = "Focus Split",
			l = { ":FocusSplitLeft<CR>", "Focus Split Left" },
			r = { ":FocusSplitRight<CR>", "Focus Split Right" },
			u = { ":FocusSplitUp<CR>", "Focus Split Up" },
			d = { ":FocusSplitDown<CR>", "Focus Split Down" },
		},
		r = { ":FocusMaxOrEqual<CR>", "Focus Max of Equal" },
	},

	t = {
		name = "Terminal",
		f = { "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", "Open Float Terminal" },
		c = { "<cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>", "Close Float Terminal" },
	},

	g = {
		name = "Git",
		t = { "<cmd>lua require('neogit').open()<CR>", "Open Neogit" },
		f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Find Git Files" },
		b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "List Branches" },
		s = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "List Status" },
		c = {
			name = "Commits",
			c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "List Git commits" },
			b = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "List Buffere's commits" },
		},
	},

	c = {
		name = "Clipboard",
		n = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Neoclip Telescope" },
		l = { "<cmd> lua require('telescope.builtin').registers", "List Registers" },
	},

	d = {
		name = "DAP",
		b = { "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "List Breakpoints" },
		v = { "<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "Variables" },
		f = { "<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "Frames" },
		c = { "<cmd>lua require'telescope'.extensions.dap.commands{}<cr>", "Commands" },
	},
	s = {
		name = "Source",
		n = { ":source $MYVIMRC<CR>", "Source Neovim Config" },
	},
}, {
	prefix = "<leader>",
})
