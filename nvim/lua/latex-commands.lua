local vim = vim

local autocmd = vim.api.nvim_create_autocmd
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
