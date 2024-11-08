local vim = vim

-- specific commands for latex files.

local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_create_user_command
local user_functions = require("user-functions")
local cmd = vim.cmd

autocmd({ "BufWritePre" }, {
	pattern = "*.tex",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			cmd("%s/\\(^\\n\\)\\{2,}/\\r/ge")
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- TODO:  which set (ascii)?
usercommand("RmNonAscii", function()
	cmd("%s/[•]//g")
end, { nargs = "?" })


