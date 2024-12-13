local vim = vim
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- local user_functions = require("user-functions")
local cmd = vim.cmd

cmd(" augroup pandoc_syntax au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc augroup END ")

-- Format on write
-- augroup("__formatter__", { clear = true })
-- autocmd("BufWritePost", {
-- 	group = "__formatter__",
-- 	command = ":FormatWrite",
-- })

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
		vim.bo.commentstring = "#\\ %s"
	end,
})

-- For clang-format files syntax highlight to work
autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.clang-format",
	callback = function()
		vim.cmd("set filetype=yaml")
	end,
})

autocmd({ "BufAdd", "BufWinEnter" }, {
	pattern = "*",
	command = "BufferOrderByBufferNumber",
})

-- TODO: Add .c files. clangd not yet right customized
--
-- Remove trailing whitespace on write.
autocmd({ "BufWritePre" }, {
	pattern = { "*.tex", "*.py", "*.sh", "*.js", "*.lua" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.notify("Formatted!", vim.log.levels.INFO)
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})
