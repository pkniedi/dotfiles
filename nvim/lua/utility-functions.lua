local vim = vim
local fn = vim.fn
local os = require("os")

local M = {}
local string = {}

M.split = function(pString, pPattern)
	-- NOTE: use {n = 0} in Lua-5.0
	local Table = {}
	local fpat = "(.-)" .. pPattern
	local last_end = 1
	local s, e, cap = pString:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(Table, cap)
		end
		last_end = e + 1
		s, e, cap = pString:find(fpat, last_end)
	end
	if last_end <= #pString then
		cap = pString:sub(last_end)
		table.insert(Table, cap)
	end
	return Table
end

M.getFileName = function()
	vim.notify('vim.fn.expand("%")', vim.log.levels.INFO)
end
M.create_default_makefile = function()
	if vim.fn.filereadable("./makefile") then
		vim.notify("File exists", 2)
	else
		vim.notify("File does not exist", 3)
	end
end

M.wordUnderCursor = function()
	return vim.fn.expand("cword")
end


return M
