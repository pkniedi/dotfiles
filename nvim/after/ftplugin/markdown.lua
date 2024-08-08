local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_buf_create_user_command
local user_functions = require("user-functions")
local map = vim.api.nvim_buf_set_keymap
local optlocal = vim.opt_local
local cmd = vim.cmd
local api = vim.api

-- local print = io.write

local textwidth = 80
cmd("set textwidth=" .. textwidth)

map(0, "n", "<space>ob", ":!firefox %<CR>", { desc = "Open file in browser" })

-- Check if render markdown plugin is available: https://github.com/MeanderingProgrammer/render-markdown.nvim
if vim.fn.exists(":RenderMarkdown") > 0 then
	vim.cmd(":RenderMarkdown enable")
end

local function split(s)
	local linelength = s:len()
	if textwidth < linelength then
		local l = textwidth
		local r = textwidth
		local preferLeft = false
		local preferRight = false

		--
		-- find next withespace on the left
		while l > 0 and string.sub(s, l, l) ~= " " do
			l = l - 1
			if string.sub(s, l, l) == "." or string.sub(s, l, l) == "," then
				preferLeft = true
			end
		end
		while r < linelength and string.sub(s, r, r) ~= " " do
			r = r + 1
		end
		local c = l
		if preferLeft then
			c = l
		elseif preferRight then
			c = r
		elseif r - textwidth < textwidth - l then
			c = r
		end

		local res = {}

		local fstHalf = string.sub(s, 0, c)
		local sndHalf = string.sub(s, c + 1, linelength)
		table.insert(res, fstHalf)
		if sndHalf:len() > textwidth then
			local recTable = split(sndHalf) or {}
			for _, v in ipairs(recTable) do
				table.insert(res, v)
			end
		else
			table.insert(res, sndHalf)
		end
		return res
	end
end

local function formatMarkdown()
	local codeblock = false
	local buf = api.nvim_buf_get_lines(0, 0, -1, false)
	for i = 1, #buf do
		if string.match(buf[i], "^[`]+") then
			codeblock = not codeblock
			i = i + 1
		end

		-- skip links (link)[https://example.com]
		if not codeblock and string.match(buf[i], "^%(.*%)%[.*%][ ]*$") then
			i = i + 1
		end

		-- Skip title lines
		if not codeblock and string.match(buf[i], "^#+") then
			i = i + 1
		end

		-- Split the line if it is longer than textwidth
		if not codeblock and buf[i]:len() > textwidth then
			local t = split(buf[i]) or {}
			if t[2] ~= "" then
				api.nvim_buf_set_lines(0, i, i + 1, false, t)
				api.nvim_buf_set_lines(0, i - 1, i, false, {})
			end
		end
	end
end

usercommand(0, "FormatMarkdown", function()
	formatMarkdown()
end, {})
map(0, "n", "<space>fm", ":FormatMarkdown<CR>", { desc = "Format markdown file" })
