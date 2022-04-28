--Setup Treesitter
local ts = require("nvim-treesitter.configs")

ts.setup({ ensure_installed = { "bash", "c", "cmake", "cpp", "dockerfile", "fish", "html", "http", "llvm", "lua", "make", "markdown", "regex", "python", "rust", "toml", "vim", "yaml", "json" }, highlight = { enable = true, additional_vim_regex_highlighting = false } })

-- Configure Raibow Parens
require("nvim-treesitter.configs").setup({
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})

-- Configure Nvim Tree Setter Contex
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		default = {
			"class",
			"function",
			"method",
			"for", -- These won't appear in the context
			"while",
			"if",
			-- 'switch',
			-- 'case',
		},
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		--   rust = {
		--       'impl_item',
		--   },
	},
})
