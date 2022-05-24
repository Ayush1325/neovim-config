local api = vim.api

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
					stdin = false,
				}
			end,
		},
		markdown = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},
		html = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},
	},
})

-- Format on Save

local formatAutogroup = api.nvim_create_augroup("FormatAutogroup", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.rs", "*.lua", "*.cpp", "*.h", "*.qml", "*.py", "*.sh", "*.toml", "*.md", "*.html" },
	command = "FormatWrite",
	group = formatAutogroup,
})
