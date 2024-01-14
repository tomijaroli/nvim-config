return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local lualine = require "lualine"
        local theme = require("plugins.themes.lualine-theme").theme()

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = theme,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = { "packer", "NVimTree" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 0,
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                    "encoding",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "fugitive" },
        }
    end,
}
