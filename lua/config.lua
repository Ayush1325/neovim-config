-- Useful Variables
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- Theme
cmd("colorscheme base16-tokyodark-terminal")

-- Editor Stuff
opt.expandtab = true
opt.hidden = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.wildmode = { "list", "longest" }
opt.mouse = "a"
opt.cursorline = true

-- Configure Indent Backlines
opt.list = true

-- Persistant Undo
opt.undofile = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Setup Tabs
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
	},
})

-- Configure Statusline
require("lualine").setup({
	options = {
		theme = "auto",
	},
})

require("indent_blankline").setup({
	-- space_char_blankline = " ",
	show_current_context = true,
})

-- Configure Tree
require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
})

-- Configure Autosave
require("auto-save").setup({
	enabled = false,
	execution_message = {
		message = function() -- message to print on save
			return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	},
	events = { "BufLeave" },
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")
		if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
	write_all_buffers = false,
	debounce_delay = 10 * 60 * 1000,
	callbacks = { -- functions to be executed at different intervals
		enabling = nil, -- ran when enabling auto-save
		disabling = nil, -- ran when disabling auto-save
		before_asserting_save = nil, -- ran before checking `condition`
		before_saving = nil, -- ran before doing the actual save
		after_saving = nil, -- ran after doing the actual save
	},
})

-- Icons
require('nvim-web-devicons').setup({})
