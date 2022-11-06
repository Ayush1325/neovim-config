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
wk.setup()
wk.register({
	b = {
		name = "Buffers",
		b = { require("telescope.builtin").buffers, "List Buffers" },
		c = { "<cmd>bd<CR>", "Close Buffer" },
		f = { "<cmd>FormatWrite<CR>", "Format Buffer" },
		s = { "<cmd>setlocal spell spelllang=en_us<CR>", "Enable Spellcheck" },
		n = { "<cmd>echo expand('%:p')<CR>", "Display File Name" },
	},

	c = {
		name = "Clipboard",
		n = { require("telescope").extensions.neoclip.default, "Neoclip Telescope" },
		l = { require("telescope.builtin").registers, "List Registers" },
	},

	d = {
		name = "DAP",
		l = {
			name = "List",
			b = { require("telescope").extensions.dap.list_breakpoints, "List Breakpoints" },
			v = { require("telescope").extensions.dap.variables, "Variables" },
			f = { require("telescope").extensions.dap.frames, "Frames" },
			c = { require("telescope").extensions.dap.commands, "Commands" },
		},
		s = {
			name = "Step Actions",
			o = { require("dap").step_over, "Step Over" },
			i = { require("dap").step_into, "Step Into" },
			u = { require("dap").step_out, "Step Out" },
			b = { require("dap").step_back, "Step Back" },
		},
		c = { require("dap").continue, "Continue" },
		b = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
		t = { require("dap").terminate, "Terminate" },
		u = { require("dapui").toggle, "Toggle DapUI" },
	},

	f = {
		name = "Files",
		f = { require("telescope").extensions.file_browser.file_browser, "Files Browser" },
		g = { require("telescope.builtin").live_grep, "Live Grep" },
	},

	g = {
		name = "Git",
		t = { require("neogit").open, "Open Neogit" },
		f = { require("telescope.builtin").git_files, "Find Git Files" },
		b = { require("telescope.builtin").git_branches, "List Branches" },
		s = { require("telescope.builtin").git_status, "List Status" },
		c = {
			name = "Commits",
			c = { require("telescope.builtin").git_commits, "List Git commits" },
			b = { require("telescope.builtin").git_bcommits, "List Buffere's commits" },
		},
	},

	h = {
		name = "Help",
		t = { require("telescope.builtin").help_tags, "Help Tags" },
	},

	l = {
		name = "LSP",
		i = { require("telescope.builtin").lsp_implementations, "LSP Implementations" },
		d = { require("telescope.builtin").lsp_definitions, "LSP Definations" },
		c = { vim.lsp.buf.code_action, "Code Action" },
		r = { vim.lsp.buf.rename, "LSP Rename" },
		l = {
			name = "List",
			r = { require("telescope.builtin").lsp_references, "LSP References" },
			s = { require("telescope.builtin").lsp_document_symbols, "LSP Document Symbols" },
			w = { require("telescope.builtin").lsp_workspace_symbols, "LSP Workspace Symbols" },
		},
		v = { "<cmd>SymbolsOutline<cr>", "Toggle Outline" },
		t = {
			name = "Trouble",
			w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostic" },
			d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostic" },
			q = { "<cmd>Trouble quickfix<cr>", "Quick Fixes" },
		},
	},

	m = {
		name = "Motion",
		w = { require("hop").hint_words, "Hit Words" },
		l = { require("hop").hint_lines_skip_whitespace, "Hint Lines" },
		c = { require("hop").hint_char1, "Hint Char" },
		C = { require("hop").hint_char2, "Hint Char" },
	},

	n = {
		name = "Nvim Tree",
		t = { ":NvimTreeToggle<CR>", "Nvim Tree Toggle" },
		r = { ":NvimTreeRefresh<CR>", "Nvim Tree Refresh" },
		f = { ":NvimTreeFindFile<CR>", "Nvim Tree Find Files" },
	},

	s = {
		name = "Source",
		n = { ":source $MYVIMRC<CR>", "Source Neovim Config" },
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
}, {
	prefix = "<leader>",
})
