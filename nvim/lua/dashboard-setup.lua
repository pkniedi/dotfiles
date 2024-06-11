require("dashboard").setup({
	-- config
	theme = "hyper", --  theme is doom and hyper default is hyper
	disable_move = true, --  default is false disable move keymap for hyper
	shortcut_type = "letter", --  shorcut type 'letter' or 'number'
	-- change_to_vcs_root -- default is false,for open file in hyper mru. it will change to the root of vcs
	config = {
		header = "Hello", -- type is table def
		week_header = {
			enable = true, --boolean use a week header
			-- concat  --concat string after time string line
			-- append  --table append after time string line
		},
		-- disable_move = false  -- boolean default is false disable move key
	},
	-- hide = {
	--   statusline    -- hide statusline default is true
	--   tabline       -- hide the tabline
	--   winbar        -- hide winbar
	-- },
	-- preview = {
	--   command       -- preview command
	--   file_path     -- preview file path
	--   file_height   -- preview file height
	--   file_width    -- preview file width
	-- },
})
