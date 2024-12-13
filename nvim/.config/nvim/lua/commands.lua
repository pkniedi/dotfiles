local vim = vim

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_create_user_command
local user_functions = require("user-functions")
local cmd = vim.cmd

-- Format on write
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

usercommand("SubR", ":%s/\\([,. ]\\)R\\([,. ]\\)/\\1$\\\\mathcal{R}$\\2/ge", {})
usercommand("SubSQL", ".s/\\([A-Z]\\{2,}\\)/\\\\verb!\\1!/ge", {})
usercommand("MvFig", ":!rm ~/screenshots/*screenshot*.png && mv ~/screenshots/*.png ./figures", {})

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
	pattern = { "*.tex", "*.c", "*.py", "*.sh", "*.js", "*.lua" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

usercommand("Italic", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textit{", "}", false, false)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "*", "*", false, false)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("Bold", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textbf{", "}", false, false)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "**", "**", false, false)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("Verb", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\verb!", "!", false, false)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("GlobalItalic", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textit{", "}", true, false)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "*", "*", true, false)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("GlobalBold", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textbf{", "}", true, false)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "**", "**", true, false)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("VisualItalic", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textit{", "}", false, true)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "*", "*", false, true)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("VisualBold", function(opts)
	local ft = vim.bo.filetype
	if ft == "tex" then
		user_functions.make_italic(opts.args, "\\textbf{", "}", false, true)
	elseif ft == "markdown" then
		user_functions.make_italic(opts.args, "**", "**", false, true)
	else
		vim.notify("Filetype " .. ft .. " not supported yet", vim.log.levels.WARN)
	end
end, { nargs = "?" })

usercommand("ChangeDef", function()
	vim.cmd("%s/^\\([# ]*\\)/\\1\\.\\//")
end, {})

