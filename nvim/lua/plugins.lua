local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"tanvirtin/monokai.nvim",
	"quangnguyen30192/cmp-nvim-ultisnips",
	"valentjn/ltex-ls",
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library items can be absolute paths
				-- "~/projects/my-awesome-lib",
				-- Or relative, which means they will be resolved as a plugin
				-- "LazyVim",
				-- When relative, you can also provide a path to the library in the plugin dir
				"luvit-meta/library", -- see below
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	-- cmp
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		lazy = false,

		dependencies = {
			"hrsh7th/cmp-calc",
			"/onsails/lspkind.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths in commands
			"SirVer/ultisnips", -- snippet engine
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				kotlin = { "ktlint" },
				terraform = { "tflint" },
				ruby = { "standardrb" },
				lua = { "luacheck" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>ll", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},

	-- lsp
	"neovim/nvim-lspconfig",
	-- snippets

	"honza/vim-snippets",

	{
		"SirVer/ultisnips",
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<C-l>"
			vim.g.UltiSnipsJumpForwardTrigger = "<C-l>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<C-h>"
			vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
		end,
	},

	-- colorschemes
	{ "navarasu/onedark.nvim", lazy = true, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },

	-- treesitter
	"nvim-treesitter/nvim-treesitter",
	-- markdown preview
	"iamcco/markdown-preview.nvim",
	-- https://github.com/lervag/vimtex
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
	},

	-- https://github.com/nvim-telescope/telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- https://github.com/nvim-lua/plenary.nvim
	"nvim-lua/plenary.nvim",
	"fraso-dev/nvim-listchars",

	-- https://github.com/lukas-reineke/indent-blankline.nvim
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- https://github.com/mhartington/formatter.nvim
	"https://github.com/mhartington/formatter.nvim",
	"m4xshen/autoclose.nvim",
	"numToStr/Comment.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", built = "make" },
	{ "tzachar/fuzzy.nvim", dependencies = "nvim-telescope/telescope-fzf-native.nvim" },

	"vijaymarupudi/nvim-fzf",
	"tzachar/cmp-fuzzy-buffer",
	"amarakon/nvim-cmp-fonts",
	-- https://github.com/sudormrfbin/cheatsheet.nvim
	"sudormrfbin/cheatsheet.nvim",
	"ryanoasis/vim-devicons",

	-- https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"sindrets/diffview.nvim",
	-- https://github.com/romgrk/barbar.nvim
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	"jinh0/eyeliner.nvim",
	"AckslD/nvim-neoclip.lua",
	"folke/which-key.nvim",
	-- https://github.com/tpope/vim-surround
	"tpope/vim-surround",
	"yamatsum/nvim-cursorline",

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "kevinhwang91/nvim-ufo", lazy = false, dependencies = "kevinhwang91/promise-async" },
	{ "stevearc/oil.nvim", lazy = false },
	-- https://github.com/sontungexpt/url-open/
	"sontungexpt/url-open",
	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({ --[[ your config ]]
			})
		end,
	},

	{ "echasnovski/mini.nvim", version = false },
	"brenoprata10/nvim-highlight-colors",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	"jghauser/follow-md-links.nvim",
	"/norcalli/nvim-colorizer.lua",
	"brenoprata10/nvim-highlight-colors",
	"mbbill/undotree",
	"/lewis6991/gitsigns.nvim",
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	"wellle/targets.vim", -- https://github.com/wellle/targets.vim
	"tpope/vim-fugitive",
	"tpope/vim-repeat", -- https://github.com/tpope/vim-repeat
	"deoplete-plugins/deoplete-clang",
	{
		"ellisonleao/carbon-now.nvim",
		lazy = true,
		cmd = "CarbonNow",
		---@param opts cn.ConfigSchema
		opts = { [[ your custom config here ]] },
	},
	"ntpeters/vim-better-whitespace",
	"mg979/vim-visual-multi",
})
