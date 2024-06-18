local vim = vim
local vars = require("variables")

vim.api.nvim_create_user_command("SubR", ":%s/\\([,. ]\\)R\\([,. ]\\)/\\1$\\\\mathcal{R}$\\2/g", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "lectures.md",
	callback = function()
		vim.o.wrap = false
	end,
})

-- Makes # <s> the devault comment for urls files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "urls",
	callback = function()
		vim.api.nvim_command("set commentstring=#\\ %s")
	end,
})

vim.api.nvim_create_autocmd({ "BufAdd" }, {
	pattern = "*",
	command = "BufferOrderByBufferNumber",
})
vim.cmd(" augroup pandoc_syntax au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc augroup END ")
