local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local theme = require("user.plugins.theme").theme()

lualine.setup {
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
    },
}
