return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-tree/nvim-web-devicons",
            config = {
                default = true,
            },
        },
        "MunifTanjim/nui.nvim",
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    ".DS_Store",
                    "thumbs.db",
                },
                never_show = {},
            },
        },
    },
    keys = {
        { "<leader>e", ":Neotree filesystem reveal left toggle<CR>", desc = "Toggle tree" },
    },
}
