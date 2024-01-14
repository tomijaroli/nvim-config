local M = {}
M.theme = function()
    local onedark = require "lualine.themes.onedark"
    return {
        inactive = {
            a = { fg = onedark.inactive.a.fg, bg = onedark.inactive.a.bg, gui = "bold" },
            b = { fg = onedark.inactive.b.fg, bg = onedark.inactive.b.bg },
            c = { fg = onedark.inactive.c.fg, bg = nil },
        },
        visual = {
            a = { fg = onedark.visual.a.fg, bg = onedark.visual.a.bg, gui = "bold" },
        },
        replace = {
            a = { fg = onedark.replace.a.fg, bg = onedark.replace.a.bg, gui = "bold" },
        },
        normal = {
            a = { fg = onedark.insert.a.fg, bg = onedark.insert.a.bg, gui = "bold" },
            b = { fg = onedark.normal.b.fg, bg = onedark.normal.b.bg },
            c = { fg = onedark.normal.c.fg, bg = nil },
        },
        insert = {
            a = { fg = onedark.normal.a.fg, bg = onedark.normal.a.bg, gui = "bold" },
        },
        command = {
            a = { fg = onedark.command.a.fg, bg = onedark.command.a.bg, gui = "bold" },
        },
    }
end
return M
