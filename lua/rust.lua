local extension_path = vim.env.HOME .. "/.var/app/com.vscodium.codium/data/codium/extensions/vadimcn.vscode-lldb-1.7.0"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

require("rust-tools").setup({
	tools = {
		autoSetHints = true,
		on_initialized = function(x)
			if x == "ok" or x == "warning" then
				-- set inlay hints
				require("rust-tools.inlay_hints").set_inlay_hints()
			end
		end,
		inlay_hints = {
			only_current_line = false,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			highlight = "Comment",
			locationLinks = false,
		},
	},
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})
