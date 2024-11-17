--    https://github.com/nvim-treesitter/nvim-treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "vim", "vimdoc", "query", "lua", "java", "python" },

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	modules = { "" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- Install parsers synchronously (only applied to `ensure_installed`)
	--
	sync_install = false,
	highlight = {
		enable = true,
		-- disable = { "tex", "md" },
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
                disable = { "ocaml" },
	},

})
