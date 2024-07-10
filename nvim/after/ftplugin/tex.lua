local vim = vim

local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_buf_create_user_command
local user_functions = require("user-functions")
local map = vim.api.nvim_buf_set_keymap
local optlocal = vim.opt_local

local opts = { noremap = true, silent = true }

local cmd = vim.cmd

autocmd({ "BufWritePre" }, {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			cmd("%s/\\(^\\n\\)\\{2,}/\\r/ge")
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- autocmd({ "ExitPre" }, {
-- 	callback = function()
-- 		local curr_line = vim.api.nvim_get_current_line()
-- 		vim.api.nvim_set_current_line(curr_line .. "  % STOPPED: here")
-- 		vim.cmd("w")
-- 	end,
-- })

-- TODO:  which set (ascii)?
usercommand(0, "RmNonAscii", function()
	cmd("%s/[•]//g")
end, { nargs = "?" })

-- jump to (sub)*section and paragraphs
map(0, "n", "<Tab>", "<Cmd>call search('\\\\\\(sub\\)*section\\|\\\\paragraph')<CR>zt", opts)
map(0, "n", "<S-Tab>", "<Cmd>call search('\\\\\\(sub\\)*section\\|\\\\paragraph', 'b')<CR>zt", opts)
