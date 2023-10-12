return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- TODO: setup: default = true,
    },
    cmd = "NvimTreeToggle",
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
    },
    config = {
        renderer = {
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = "", -- arrow when folder is closed
                        arrow_open = "", -- arrow when folder is open
                    },
                },
            },
        },
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
    },
}
