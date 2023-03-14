local api = vim.api

-- Format on Save for Lsp Formatting
-- local formatAutogroup = api.nvim_create_augroup("FormatAutogroup", { clear = true })
-- api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = { "*.lua" },
-- 	command = "lua vim.lsp.buf.format()",
-- 	group = formatAutogroup,
-- })
