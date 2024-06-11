-- github repository: https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		layout_config = {
			prompt_position = "bottom",
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
	-- pickers = {
	-- 	find_files = {
	-- 		theme = "dropdown",
	-- 	},
	-- },

	extensions = {
		fzf = {
			fuzzy = true, -- Enable FZF's fuzzy searching
			override_generic_sorter = true, -- Override Telescope's generic sorter with FZF
			override_file_sorter = true, -- Override Telescope's file sorter with FZF
		},
	},
})
require('telescope').load_extension('fzf')
require("telescope").load_extension("noice")
