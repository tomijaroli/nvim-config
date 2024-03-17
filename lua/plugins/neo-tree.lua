return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            commit = "f7adfc4b3f4f91aab6caebf42b3682945fbc35be",
        },
        {
            "nvim-tree/nvim-web-devicons",
            commit = "cb0c967c9723a76ccb1be0cc3a9a10e577d2f6ec",
            opts = {
                default = true,
            },
        },
        {
            "MunifTanjim/nui.nvim",
            version = "v0.3.0",
        },
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
