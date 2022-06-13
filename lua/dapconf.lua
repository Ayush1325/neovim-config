local dap, dapui = require("dap"), require("dapui")

-- DAP Config
dapui.setup({})

-- Open and Close DAP UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Python
require("dap-python").setup("~/.virtualenvs/edk2-basetools-zqrw/bin/python")

-- Launch Json
require("dap.ext.vscode").load_launchjs()

-- Enable Virtual Text
require("nvim-dap-virtual-text").setup()
