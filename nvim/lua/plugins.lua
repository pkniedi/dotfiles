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
	"quangnguyen30192/cmp-nvim-ultisnips",
	"valentjn/ltex-ls",
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
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
			"onsails/lspkind.nvim",
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
		lazy = false,
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<C-l>"
			vim.g.UltiSnipsJumpForwardTrigger = "<C-l>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<C-h>"
			vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
		end,
	},

	-- colorschemes
	-- others: https://vimcolorschemes.com/i/trending

	-- https://github.com/rose-pine/neovim
	{ "rose-pine/neovim", name = "rose-pine" },
	"tanvirtin/monokai.nvim",
	{ "navarasu/onedark.nvim", lazy = true, priority = 1000 },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- optional configuration here
			})
			require("bamboo").load()
		end,
	},
	{ "scottmckendry/cyberdream.nvim", lazy = true, priority = 1000 },
	-- Using lazy.nvim
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	-- https://github.com/folke/tokyonight.nvim
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },

	-- treesitter
	"nvim-treesitter/nvim-treesitter",
	-- https://github.com/lervag/vimtex
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
	},

	-- https://github.com/nvim-telescope/telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
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
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
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

	-- https://github.com/akinsho/bufferline.nvim
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
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
	-- "/norcalli/nvim-colorizer.lua",
	"brenoprata10/nvim-highlight-colors",
	"mbbill/undotree",
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	-- https://github.com/wellle/targets.vim
	-- Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
	-- It expands on the idea of simple commands like di' (delete inside the single quotes around the cursor)
	-- to give you more opportunities to craft powerful commands that can be repeated reliably.
	-- One major goal is to handle all corner cases correctly.
	"wellle/targets.vim",

	"tpope/vim-fugitive",
	"tpope/vim-repeat", -- https://github.com/tpope/vim-repeat
	"deoplete-plugins/deoplete-clang",
	{
		"ellisonleao/carbon-now.nvim",
		lazy = true,
		cmd = "CarbonNow",
		opts = { [[ your custom config here ]] },
	},
	-- "ntpeters/vim-better-whitespace",
	"mg979/vim-visual-multi",

	-- https://github.com/MeanderingProgrammer/render-markdown.nvim
	-- Renders markdown with :RenderMarkdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},

	-- rust tools
	"simrat39/rust-tools.nvim",

	-- Debugging
	"mfussenegger/nvim-dap",
	"masukomi/vim-markdown-folding",

	--- compiler plugin

	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},

	"github/copilot.vim",
	--- dashboard: https://github.com/MeanderingProgrammer/dashboard.nvim
	--- ascii: https://github.com/MaximilianLloyd/ascii.nvim?tab=readme-ov-file
	{
		{
			"MeanderingProgrammer/dashboard.nvim",
			event = "VimEnter",
			dependencies = {
				{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
			},
			-- config = function()
			-- 	require("dashboard").setup({
			-- 		header = require("ascii").get_random_global(),
			-- 		date_format = "%Y-%m-%d %H:%M:%S",
			-- 		directories = {
			-- 			"~/.config",
			-- 			"~/.config/nvim/lua",
			-- 			"~/.config/nvim/hypr",
			-- 			"~/.config/nvim/hypr",
			-- 			"~/notes/zettelkasten",
			-- 		},
			-- 		footer = {},
			-- 		-- Gets called after directory is changed and is provided with the
			-- 		-- directory path as an argument
			-- 		on_load = function(path)
			-- 			vim.notify("Loaded " .. path)
			-- 		end,
			-- 		-- Highlight groups to use for various components
			-- 		highlight_groups = {
			-- 			header = "Constant",
			-- 			icon = "Type",
			-- 			directory = "Delimiter",
			-- 			hotkey = "Statement",
			-- 		},
			-- 	})
			-- end,
		},
	},
	-- https://github.com/shortcuts/no-neck-pain.nvim
	{ "shortcuts/no-neck-pain.nvim", version = "*" },
})
