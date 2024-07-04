local vim = vim
local fn = vim.fn
local handlers = require("url-open.modules.handlers")
local option_module = require("url-open.modules.options")

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
		handlers.open_url_with_app({ "vlc" }, url)
		return true
	else
		return false
	end
end

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

M.my_open_url = function()
	local curr_line = vim.api.nvim_get_current_line()
	if vim.fn.filereadable(vim.fn.expand("<cfile>")) == 1 then
		vim.api.nvim_command("edit " .. vim.fn.expand("<cfile>"))
	elseif M.open_vlc_special(curr_line) then
		print("VLC")
	elseif M.is_valid_filepath() then
		print("hello there")
	elseif M.open_mp4(curr_line) then
		print("MP4")
	else
		handlers.open_url(option_module.DEFAULT_OPTIONS)
	end
end

return M
