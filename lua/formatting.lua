local api = vim.api
local util = require("formatter.util")

local toolbox = "toolbox run -c formatters "

local function prettier_format()
	return {
		exe = toolbox .. "prettier",
		args = { "--stdin-filepath", vim.fn.fnameescape(api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

local function clang_format()
	return {
		exe = toolbox .. "clang-format",
		args = {
			"-assume-filename",
			util.escape_path(util.get_current_buffer_file_name()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

-- Configure Formatter
require("formatter").setup({
	filetype = {
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "+nightly" },
					stdin = true,
				}
			end,
		},
		sh = {
			function()
				return {
					exe = toolbox .. "shfmt",
					args = { "-i", 2 },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = toolbox .. "stylua",
					stdin = false,
				}
			end,
		},
		cpp = {
			clang_format,
		},
		c = {
			clang_format,
		},
		cmake = {
			function()
				return {
					exe = toolbox .. "cmake-format",
					args = { "-i" },
					stdin = false,
				}
			end,
		},
		toml = {
			function()
				return {
					exe = toolbox .. "taplo",
					args = { "format" },
					stdin = false,
				}
			end,
		},
		python = {
			function()
				return {
					exe = toolbox .. "autopep8-3",
					args = { "--in-place" },
					stdin = false,
				}
			end,
		},
		markdown = {
			prettier_format,
		},
		html = {
			prettier_format,
		},
		css = {
			prettier_format,
		},
		scss = {
			prettier_format,
		},
	},
})

-- Format on Save
local formatAutogroup = api.nvim_create_augroup("FormatAutogroup", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.rs", "*.lua", "*.cpp", "*.h", "*.sh", "*.html", "*.c", "*.py", "*.css", "*.scss", "*.cu" },
	command = "FormatWrite",
	group = formatAutogroup,
})
