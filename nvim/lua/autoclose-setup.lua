-- github repository: https://github.com/m4xshen/autoclose.nvim

require("autoclose").setup({
	keys = {
		["("] = { escape = false, close = true, pair = "()" },
		["["] = { escape = false, close = true, pair = "[]" },
		["{"] = { escape = false, close = true, pair = "{}" },

		[")"] = { escape = true, close = false, pair = "()" },
		["]"] = { escape = true, close = false, pair = "[]" },
		["}"] = { escape = true, close = false, pair = "{}" },

		['"'] = { escape = true, close = true, pair = '""', disabled_filetypes = { "tex", "haskell" } },
		["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "tex", "haskell" } },
		["`"] = { escape = true, close = true, pair = "``" },
	},
	options = {
		disabled_filetypes = { "text", "sh", "markdown", "zsh", "config" },
		disable_when_touch = false,
		touch_regex = "[%w(%[{]",
		pair_spaces = false,
		auto_indent = true,
		disable_command_mode = true,
	},
})
