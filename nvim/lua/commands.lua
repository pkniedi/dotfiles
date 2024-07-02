local vim = vim

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_create_user_command
local cmd = vim.cmd

-- Format on write
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

usercommand("SubR", ":%s/\\([,. ]\\)R\\([,. ]\\)/\\1$\\\\mathcal{R}$\\2/ge", {})
usercommand("SubSQL", ".s/\\([A-Z]\\{2,}\\)/\\\\verb!\\1!/ge", {})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "lectures.md",
	callback = function()
		vim.o.wrap = false
	end,
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "urls",
	callback = function()
		vim.api.nvim_command("set commentstring=#\\ %s")
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

vim.cmd(" augroup pandoc_syntax au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc augroup END ")

-- Remove trailing whitespace on write.
autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		print("HELLO DEBUG")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})
