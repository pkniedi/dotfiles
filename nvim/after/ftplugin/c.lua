local vim = vim

local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_buf_create_user_command
local user_functions = require("user-functions")
local map = vim.api.nvim_buf_set_keymap
local optlocal = vim.opt_local

local opts = { noremap = true, silent = true }

local cmd = vim.cmd

-- NOTE: only used in t.c

