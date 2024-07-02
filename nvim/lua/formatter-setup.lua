-- github repository: https://github.com/mhartington/formatter.nvim
-- github repo. filetypes: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
--
-- NOTE: You need to install the executables manually, otherwise the formatting won't work (since: Wed 27.09 11:05)

-- Utilities for creating configurations
-- local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands

local util = require("formatter.util")
local vim = vim
local variables = require("variables")

require("formatter").setup({
	-- Enable or disable logging
	logging = false,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		html = {
			require("formatter.filetypes.html").prettier,
		},

		haskell = {
			require("formatter.filetypes.haskell").stylish_haskell,
		},

		javascript = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename",
						"-style=file:"
							.. vim.fn.expand("$HOME")
							.. ".config/nvim/.clang-format-files/javascript.clang-format",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},

		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		tex = {
			function()
				return {
					exe = "latexindent",
					args = {},
					stdin = true,
				}
			end,
		},

		java = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-assume-filename",
						"-style=file:" .. variables.clang_format_files_dir .. "javascript.clang-format",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		zsh = {
			require("formatter.filetypes.sh").shfmt,
		},
		css = {
			require("formatter.filetypes.css").cssbeautify,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-style=file:" .. variables.clang_format_files_dir .. "c.clang-format",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
	},
})
