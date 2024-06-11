-- github repository: https://github.com/mhartington/formatter.nvim
-- github repo. filetypes: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
--
-- NOTE: You need to install the executables manually, otherwise the formatting won't work (since: Wed 27.09 11:05)

-- Utilities for creating configurations
-- local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands

require("formatter").setup({
	-- Enable or disable logging
	logging = false,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		html = {
			function()
				return {
					exe = "tidy -m",
					stdin = true,
				}
			end,
			require("formatter.filetypes.html").tidy,
		},

		haskell = {
			require("formatter.filetypes.haskell").stylish_haskell,
		},

		javascript = {
			require("formatter.filetypes.javascript").clangformat,
		},

		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		java = {

			function()
				-- Full specification of configurations is down below and in Vim help
				-- files
				-- available formats: LLVM|GNU|Google|Chromium|Microsoft|Mozilla|WebKit
				return {
					exe = "clang-format",
					args = {
						-- "--style=LLVM",
						-- "--style=WebKit",
						-- "--style=Google",
						"--style=Chromium",
						-- "--style=Microsoft",
						-- "--style=GNU",
						"-i",
					},
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
				-- Full specification of configurations is down below and in Vim help
				-- files
				-- available formats: LLVM|GNU|Google|Chromium|Microsoft|Mozilla|WebKit
				return {
					exe = "clang-format",
					args = {
						"--style=Chromium",
						-- "--style=GNU",
						"-i",
					},
				}
			end,
			-- require("formatter.filetypes.c").clangformat,
		},
	},
})
