return {
    {
        "tpope/vim-fugitive",
        tag = "v3.7",
    },
    {
        "lewis6991/gitsigns.nvim",
        version = "v0.7",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            }

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        commit = "774dcecbd0b9b57be6c150adacb60ced79b11b23",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        keys = {
            { "lg", "<cmd>LazyGit<CR>", desc = "Open lazygit" },
        },
    },
}
