require("rust-tools").setup({
	tools = {
		autoSetHints = true,
		inlay_hints = {
			only_current_line = false,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			highlight = "Comment",
		},
	},
})
