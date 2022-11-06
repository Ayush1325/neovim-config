local api = vim.api
local util = require("formatter.util")

function prettier_format()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.fnameescape(api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

function clang_format()
	return {
		exe = "clang-format",
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
					stdin = false,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.fn.shellescape(api.nvim_buf_get_name(0)) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end,
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.fn.shellescape(api.nvim_buf_get_name(0)) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end,
		},
		cmake = {
			function()
				return {
					exe = "cmake-format",
					args = { "-i" },
					stdin = false,
				}
			end,
		},
		toml = {
			function()
				return {
					exe = "taplo",
					args = { "format" },
					stdin = false,
				}
			end,
		},
		qml = {
			function()
				return {
					exe = "qmlfmt",
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "autopep8-3",
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
	pattern = { "*.rs", "*.lua", "*.cpp", "*.h", "*.qml", "*.sh", "*.html", "*.c", "*.py", "*.css", "*.scss", "*.cu" },
	command = "FormatWrite",
	group = formatAutogroup,
})
