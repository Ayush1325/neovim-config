-- Useful Variables
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- Theme
cmd("colorscheme dracula")

-- Dashboard
g.dashboard_default_executive = "telescope"

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

-- Setup nvim-cmp.
opt.completeopt = { "menuone", "noinsert", "noselect" }
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

-- Setup Tabs
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
	},
})

-- Configure Feline
require("feline").setup()

-- Configure Indent Backlines
opt.list = true
opt.listchars:append("space:⋅")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
})

-- Configure Tree
require("nvim-tree").setup({})

-- Configure Nvim Project
require("project_nvim").setup({})

-- Configure Focus
require("focus").setup()

-- Configure Formatter
require("formatter").setup({
	filetype = {
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		sh = {
			function()
				return {
					exe = "shfmt",
					args = { "-i", 2 },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end,
		},
		cmake = {
			function()
				return {
					exe = "cmake-format",
					stdin = true,
				}
			end,
		},
		toml = {
			function()
				return {
					exe = "taplo format",
					stdin = false,
				}
			end,
		},
	},
})

-- Format on Save
api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.cpp,*.h,CMakeLists.txt,*.toml FormatWrite
augroup END
]],
	true
)

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
