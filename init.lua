require("plugins")
require("config")
require("telescopeconf")
require("treesitterconf")
require("lspconf")
require("completion")
require("gitconf")
require("keys")
require("rust")
require("formatting")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
