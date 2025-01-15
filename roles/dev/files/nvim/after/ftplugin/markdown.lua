local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_buf_create_user_command
local user_functions = require("user-functions")
local map = vim.api.nvim_buf_set_keymap
local optlocal = vim.opt_local
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local cwd = vim.fn.expand("%:p:h")
local home = vim.fn.expand("$HOME")

-- TODO: Cut ./
local fileLinkHelper = function(opts)
        opts = opts or {}
        pickers
            .new(opts, {
                    prompt_title = "Find file",
                    finder = finders.new_oneshot_job({ "find" }, opts),
                    sorter = conf.generic_sorter(opts),
                    attach_mappings = function(prompt_bufnr)
                            actions.select_default:replace(function()
                                    actions.close(prompt_bufnr)
                                    local selection = action_state.get_selected_entry()
                                    api.nvim_put({ selection[1] }, "", false, true)
                            end)
                            return true
                    end,
            })
            :find()
end

usercommand(0, "CreateLink", function()
        fileLinkHelper()
end, {})

map(0, "i", "<C-f>", "<esc>:CreateLink<CR>", {})

-- Formatting
local textwidth = 180
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

                -- skip lists
                while string.match(buf[i], "^[ ]*-.*") do
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
                                api.nvim_buf_set_lines(0, i, i, false, t)
                                api.nvim_buf_set_lines(0, i - 1, i, false, {})
                        end
                end
        end
end

-- api.nvim_buf_del_keymap(0, "n", "<leader>fo")
map(0, "n", "<space>fo", ":FormatMarkdown <CR>", {})

-- Workaround: used for the keymap because buffer local maps cannot call a function directly
usercommand(0, "FormatMarkdown", function()
        pcall(formatMarkdown)
end, {})

map(0, "n", "<space>fm", ":FormatMarkdown<CR>", { desc = "Format markdown file" })

map(0, "n", "<Tab>", "<Cmd>call search('^## ')<CR>zt", {})            -- Jump to next heading
map(0, "n", "<s-Tab>", "<Cmd>call search('^## ','b')<CR>zt", {})        -- Jump to prev heading
map(0, "n", "<leader>gl", "<Cmd>call search('^## Links')<CR>zt", {}) -- go to links

-- Autocommand creating files from templates when new

-- autocmd({ "VimEnter" }, {
--         vim.cmd("NoNeckPain"),
-- })

-- Key map for toggling RenderMarkdown plugin
map(0, "n", "<space>rt", ":RenderMarkdown toggle<CR>", { desc = "Toggle rendering markdown (plugin)" })

local findWiki = function()
        local res = vim.fn.search("\\[wiki\\]")
        if res ~= 0 then
                api.nvim_win_set_cursor(0,res)
        end
end

usercommand(0, "FindWiki", function()
        pcall(findWiki)
end, {})

map(0, "n", "<space>ww", ":FindWiki <CR>", { desc = "Toggle rendering markdown (plugin)" })


map(0, "n", "<space>ni", "highlight markdownItalic cterm=NONE gui=NONE", { desc = "Don't highlight italic" })

