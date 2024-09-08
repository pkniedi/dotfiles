local vim = vim
local fn = vim.fn
local handlers = require("url-open.modules.handlers")
local option_module = require("url-open.modules.options")
local util = require("utility-functions")
local io = require("io")
local api = vim.api

local M = {}

-- Changed the behaviour of open_url plugin slighty to open vlc commands in notes.

M.is_valid_filepath = function()
	local line_number = vim.api.nvim_win_get_cursor(0)[1]
	local line_content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
	print(line_content)
	return vim.fn.filereadable(line_content) == 1
end

M.open_mp4 = function(s)
	local from, to = string.find(s, "http[s]*://[%S]*%.mp4")
	if from ~= nil and to ~= nil then
		local url = string.sub(s, from, to)
		if fn.executable("vlc") == 1 then
			fn.jobstart("vlc  --rate=1.5 " .. url, {
				detach = true,
				on_exit = function(_, code, _)
					print(code)
					if code ~= 0 then
						print("Error code:" .. code)
					end
				end,
			})
			return true
		end
		return true
	else
		return false
	end
end

--- Opens the url (mp4 file) in a new vlc instance
---@param s String the current line
---@return boolean true if it found the special pattern %[vlc.*&>/dev/null &%]
M.open_vlc_special = function(s)
	local from, to = string.find(s, "%[vlc.*&>/dev/null &%]")

	if from ~= nil and to ~= nil then
		local cmd = string.sub(s, from + 1, to - 1)
		if fn.executable("vlc") == 1 then
			fn.jobstart(cmd, {
				detach = true,
				on_exit = function(_, code, _)
					print(code)
					if code ~= 0 then
						print("Error code:" .. code)
					end
				end,
			})
			return true
		end
		return true
	else
		print("No match found")
		return false
	end
end

---Gets the file extension, if it exists
---@param path any
---@return nil
M.get_filetype_extension = function(path)
	local pathReversed = string.reverse(path)
	local s, e = string.find(pathReversed, "%.")
	if s == nil or e == nil then
		return nil
	end
	local res = string.reverse(string.sub(pathReversed, 0, e - 1))
	return res
end

-- Utility for gx keymap.
-- tests:
-- ~/resources/mathematics/real-analysis/pvw-analysis.pdf
M.my_open_url = function()
	local curr_line = vim.api.nvim_get_current_line()
	local cfile = vim.fn.expand("<cfile>")

	if fn.filereadable(cfile) then
		-- TODO: check whether it is better to check the filetype?
		--
		-- If the file extension is pdf, then use zathura to open the file
		if M.get_filetype_extension(cfile) == "pdf" then
			if fn.executable("zathura") == 1 then
				fn.jobstart("zathura " .. cfile, {
					detach = true,
					on_exit = function(_, code, _)
						print(code)
						if code ~= 0 then
							print("Error code:" .. code)
						end
					end,
				})
				return true
			end
		end
		-- else just edit the file
		vim.api.nvim_command("edit " .. vim.fn.expand("<cfile>"))
	elseif M.open_vlc_special(curr_line) then
		print("VLC")
	elseif M.is_valid_filepath() then
		print("hello there")
	elseif M.open_mp4(curr_line) then
		print("MP4")
	end
	-- else
	-- 	handlers.open_url(option_module.DEFAULT_OPTIONS)
	-- end
end

---Wrap argument string with left and right pattern
---
---
---@param toReplace string
---@param leftPattern string
---@param rightPattern string
---@param global boolean
---@param visual boolean
---
M.make_italic = function(toReplace, leftPattern, rightPattern, global, visual)
	local range = global and "%" or "."
	range = visual and "'<,'>" or range
	local l_chars = "\\([ ]\\+\\)"
	local r_chars = "\\([ .;:,]\\+\\)"
	pcall(function()
		vim.cmd(
			range
				.. "s/"
				.. l_chars
				.. "\\("
				.. toReplace
				.. "\\)"
				.. r_chars
				.. "/\\1\\"
				.. leftPattern
				.. "\\2"
				.. rightPattern
				.. "\\3/ge"
		)

		-- Check for begining of line
		vim.cmd(
			range
				.. "s/^"
				.. "\\("
				.. toReplace
				.. "\\)"
				.. r_chars
				.. "/"
				.. leftPattern
				.. "\\1"
				.. rightPattern
				.. "\\2/ge"
		)
		-- Check for end of line
		vim.cmd(
			range
				.. "s/"
				.. l_chars
				.. "\\("
				.. toReplace
				.. "\\)"
				.. "$/\\1"
				.. leftPattern
				.. "\\2"
				.. rightPattern
				.. "/ge"
		)
		-- Check for single work line
		vim.cmd(
			range .. "s/^" .. "\\(" .. toReplace .. "\\)" .. "$" .. "/" .. leftPattern .. "\\1" .. rightPattern .. "/ge"
		)
		vim.cmd("noh")
	end)
end

M.split = function(s, textwidth)
	local linelength = s:len()
	if textwidth < linelength then
		local l, r = textwidth, textwidth
		--
		-- find next withespace on the left
		while l >= 0 and string.sub(s, l, l) ~= " " do
			l = l - 1
		end
		while r < linelength and string.sub(s, r, r) ~= " " do
			r = r + 1
		end
		local c = l
		if r - textwidth < textwidth - l then
			c = r
		end
		local res = {}
		local fstHalf = string.sub(s, 0, c)
		local sndHalf = string.sub(s, c + 1, linelength)
		table.insert(res, fstHalf)
		if sndHalf:len() > textwidth then
			local recTable = M.split(sndHalf, textwidth) or {}
			for _, v in ipairs(recTable) do
				table.insert(res, v)
			end
		else
			table.insert(res, sndHalf)
		end
		return res
	end
end

-- TODO: Check for correct environment
M.splitToTextWidth = function(textwidth)
	local buf = api.nvim_buf_get_lines(0, 0, -1, false)
	for i = 1, #buf do
		-- get the table of split lines

		if string.match(buf[i], "^[#`]+") then
			vim.notify(buf[i], 3)
			-- NOTE: ad hoc solution! If the word is longer than 20, we have a problem
		elseif buf[i]:len() > textwidth + 20 then
			local t = M.split(buf[i], textwidth) or {}
			api.nvim_buf_set_lines(0, i, i + 1, false, t)
			api.nvim_buf_set_lines(0, i - 1, i, false, {})
		end
	end
end
return M
