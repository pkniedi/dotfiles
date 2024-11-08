-- https://github.com/mhartington/formatter.nvim
-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes

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
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		-- haskell = {
		-- 	function()
		-- 		return {
		-- 			exe = "ormolu",
		-- 			args = {
		-- 				" --mode inplace",
		-- 				util.escape_path(util.get_current_buffer_file_name()),
		-- 			},
		-- 			stdin = true,
		-- 		}
		-- 	end,
		-- },

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
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		sh = {
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
		zsh = {
			function()
				local shiftwidth = vim.opt.shiftwidth:get()
				local expandtab = vim.opt.expandtab:get()

				if not expandtab then
					shiftwidth = 0
				end
				return {
					exe = "beautysh",
					args = {
						"-i",
						shiftwidth,
						util.escape_path(util.get_current_buffer_file_path()),
					},
				}
			end,
		},
		json = {
			function()
				return {
					exe = "python -m json.tool",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
					},
				}
			end,
		},
	},
})
