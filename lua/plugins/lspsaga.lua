return {
    "nvimdev/lspsaga.nvim",
    commit = "01dc5ea5916abbe3158d2661e21d90dcc04d7c47",
    config = function()
        require("lspsaga").setup {
            move_in_saga = {
                prev = "<C-k>",
                next = "<C-j>",
            },
            finder_action_keys = {
                open = "<CR>",
            },
            definition_action_keys = {
                edit = "<CR>",
            },
        }
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
