-- Useful Variables
local opt = vim.opt
local cmd = vim.cmd

-- Editor Stuff
opt.expandtab = false
opt.hidden = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.wildmode = { "list", "longest" }
opt.mouse = "a"
opt.cursorline = true

-- Configure Indent Backlines
opt.list = true

-- Persistant Undo
opt.undofile = true

-- Clipboard
opt.clipboard = "unnamedplus"

return {
	{
		"hoob3rt/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = true,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
			})
		end,
	},
	{
		"Pocco81/auto-save.nvim",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		config = true,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"phaazon/hop.nvim",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"FelipeLema/cmp-async-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help"
		},
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "luasnip", keyword_length = 2 },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help", keyword_length = 3 },
					{ name = "buffer" },
					{ name = "async_path", keyword_length = 3 },
				})
			})

			cmp.setup.filetype('lua', {
				sources = cmp.config.sources({
					{ name = "luasnip", keyword_length = 2 },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help", keyword_length = 3 },
					{ name = "buffer" },
					{ name = "async_path", keyword_length = 3 },
				})
			})

 			cmp.setup.cmdline({ '/', '?' }, {
    		mapping = cmp.mapping.preset.cmdline(),
    		sources = {
      		{ name = 'buffer' }
    		}
  		})

			cmp.setup.cmdline(':', {
  		  mapping = cmp.mapping.preset.cmdline(),
  		  sources = cmp.config.sources({
  		    { name = 'path' }
  		  }, {
  		    { name = 'cmdline' }
  		  })
  		})
		end,
	},
}
