local vim = vim
require("dashboard").setup({
	header = require("ascii").get_random_global(),
	date_format = "%Y-%m-%d %H:%M:%S",
	directories = {
		"~/.config",
		"~/.config/nvim/after/ftplugin",
		"~/.config/nvim/lua",
		"~/.config/nvim/hypr",
		"~/.config/nvim/hypr",
		"~/notes/zettelkasten",
	},
	footer = {},
	-- Gets called after directory is changed and is provided with the
	-- directory path as an argument
	on_load = function(path)
		vim.notify("Loaded " .. path)
	end,
	-- Highlight groups to use for various components
	highlight_groups = {
		header = "Constant",
		icon = "Type",
		directory = "Delimiter",
		hotkey = "Statement",
	},
})