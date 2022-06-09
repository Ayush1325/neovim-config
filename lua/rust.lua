require("rust-tools").setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "clippy",
				},
				diagnostics = {
					disabled = { "unlinked-file" },
				},
			},
		},
	},

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
