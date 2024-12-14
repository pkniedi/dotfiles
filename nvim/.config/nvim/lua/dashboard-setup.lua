local vim = vim
local user_functions = require("user-functions")

local M = {}

M.get_header = function()
	local pwd = vim.fn.getcwd()
	local home = vim.fn.expand("$HOME")
	if pwd:find("zettelkasten") then
		return user_functions.get_dashboard_figlet("NOTES")
	elseif pwd:find(".config") then
		local loc = ""
		if pwd:find("nvim") then
			loc = "nvim"
			-- if pwd:find("lua") then
			--         loc = "nvim/lua"
			-- else
			--         loc = "nvim"
			-- end
		elseif pwd:find("zsh") then
			loc = "zsh"
		elseif pwd:find("hypr") then
			loc = "hypr"
		elseif pwd:find("tmux") then
			loc = "tmux"
		elseif pwd:find("alacritty") then
			loc = "alacritty"
		elseif pwd:find("kitty") then
			loc = "kitty"
		end
		return user_functions.get_dashboard_figlet(loc .. " CONFIG")
	elseif pwd == home then
		return user_functions.get_dashboard_figlet("HELLO THERE")
	else
		return require("ascii").art.text.neovim.sharp
	end
end

M.get_footer = function()
	local pwd = vim.fn.getcwd()

	local res = vim.fn.system("fortune")
	local lines = {}

	-- Use string.gmatch to match all lines separated by '\n'
	for line in string.gmatch(res, "([^\n]+)") do
		table.insert(lines, line)
	end
	return lines
end

M.get_local_files = function()
	local cwd = vim.fn.getcwd()
	local files = vim.fn.system("find . -maxdepth 1 -type d")
        local home = vim.fn.expand("$HOME")
	local lines = { ".", ".." }

	local count = 0
	for line in string.gmatch(files, "([^\n]+)") do
		if line == "." and line == ".." and line ~= home then
			table.insert(lines, line)
			count = count + 1
		end
		if count > 7 then
			break
		end
	end
	return lines
end

require("dashboard").setup({
	-- get header based on pwd

	-- header = require('ascii').art.series.theoffice.prison_mike,
	date_format = "%Y-%m-%d %H:%M:%S",
	header = M.get_header(),
	directories = M.get_local_files(),
	-- footer = M.get_footer(),
})
