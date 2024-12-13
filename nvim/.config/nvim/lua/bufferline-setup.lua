local vim = vim
vim.opt.termguicolors = true

require("bufferline").setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				highlights = "NvimTreeNormal",
				padding = 1,
			},
		},
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		indicator_icon = "▎",
		-- buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
	},
	highlights = {
		background = {
			guibg = "NONE",
		},
		fill = {
			guibg = "NONE",
		},
		close_button = {
			guibg = "NONE",
		},
		separator_visible = {
			guibg = "NONE",
		},
		tab_close = {
			guibg = "NONE",
		},
	},
})
 vim.cmd([[
 autocmd ColorScheme * highlight BufferLineFill guibg=none
 autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e guibg=none
 autocmd ColorScheme * highlight BufferLineBufferSelected guifg=none gui=none
 autocmd ColorScheme * highlight BufferLineBufferVisible guifg=#7a7c9e gui=none
 autocmd ColorScheme * highlight BufferLineBufferInactive guifg=#7a7c9e gui=none
 autocmd ColorScheme * highlight BufferLineCloseButton guifg=#7a7c9e gui=none
 ]])
