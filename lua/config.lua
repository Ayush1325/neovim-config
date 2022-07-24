-- Useful Variables
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- Theme
-- g.vscode_style = "dark"
-- cmd("colorscheme vscode")
-- vim.o.background = "dark"
local onedarkpro = require("onedarkpro")

onedarkpro.setup({
	theme = "onedark_dark",
})

onedarkpro.load()

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

-- Clipboard
opt.clipboard = "unnamedplus"
-- require("neoclip").setup({})

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
-- require("feline").setup()
require("lualine").setup({
	options = {
		theme = "auto",
	},
})

-- Configure Indent Backlines
opt.list = true
-- opt.listchars:append("space:⋅")

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

-- Configure Nvim Project
require("project_nvim").setup({})
require("telescope").load_extension("projects")

-- Configure Focus
-- require("focus").setup()

-- Configure Autosave
require("autosave").setup({
	enabled = true,
	execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
	events = { "InsertLeave", "TextChanged" },
	conditions = {
		exists = true,
		filename_is_not = {},
		filetype_is_not = {},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 10 * 60 * 1000,
})

-- Configure Autopairs
require("nvim-autopairs").setup({})

-- Easymotion
require("hop").setup()
