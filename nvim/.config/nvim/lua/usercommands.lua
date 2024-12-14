local vim = vim

local usercommand = vim.api.nvim_create_user_command
local user_functions = require("user-functions")

usercommand("SubR", ":%s/\\([,. ]\\)R\\([,. ]\\)/\\1$\\\\mathcal{R}$\\2/ge", {})
usercommand("SubSQL", ".s/\\([A-Z]\\{2,}\\)/\\\\verb!\\1!/ge", {})

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

usercommand("Figlet", function(opts)
        user_functions.print_commented_figlet(opts.args)
end, { nargs = "?" })

usercommand("ChangeDef", function()
        vim.cmd("%s/^\\([# ]*\\)/\\1\\.\\//")
end, {})
