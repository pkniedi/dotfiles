-- listchars_config.lua

-- listchars CONFIGURATION:

require("nvim-listchars").setup({
	save_state = true,
	listchars = {
		eol = "󱞦",
		tab = "» ",
		space = "󱁐",
	},
	exclude_filetypes = {},
	lighten_step = 10,
})
