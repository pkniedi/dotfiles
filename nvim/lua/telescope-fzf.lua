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
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
