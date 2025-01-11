local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local cwd = vim.fn.expand("%:p:h")
local home = vim.fn.expand("$HOME")
local vim = vim
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn
local api = vim.api
-- local user_functions = require("user-functions")
local cmd = vim.cmd

cmd(" augroup pandoc_syntax au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc augroup END ")

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "lectures.md",
	callback = function()
		vim.o.wrap = false
	end,
})

autocmd({ "CursorHold" }, {
	pattern = "*.tex",
	command = ":Format",
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "urls", "defaults" },
	callback = function()
		vim.bo.commentstring = "# %s"
	end,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "rasi" },
	callback = function()
		vim.bo.commentstring = "/*%s*/"
	end,
})


autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.pml" },
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})

-- For clang-format files syntax highlight to work
autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.clang-format",
	callback = function()
		vim.cmd("set filetype=yaml")
	end,
})

-- TODO: Add .c files. clangd not yet right customized
--
-- Remove trailing whitespace on write.
autocmd({ "BufWritePre" }, {
	pattern = { "*.tex", "*.py", "*.sh", "*.js", "*.lua" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- NOTE: needs to be here

local cwd = vim.fn.expand("%:p:h")
local home = vim.fn.expand("$HOME")
--
-- TODO: fix file name need to substitute - and remove extension
--
-- if cwd == home .. "/notes/zettelkasten" then
-- 	-- TODO: Create template for new files
-- 	autocmd({ "BufNewFile" }, {
-- 		pattern = { "*" },
-- 		callback = function()
-- 			api.nvim_buf_set_lines(0, 0, 2, false, { "# " .. fn.expand("%"), "", "", "# Links" })
-- 		end,
-- 	})
-- 	vim.notify("IMPLEMENT", vim.log.levels.WARN)
-- end
