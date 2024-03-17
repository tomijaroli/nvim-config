return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        commit = "9ef21b2e6bb6ebeaf349a0781745549bbb870d27",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            commit = "f7adfc4b3f4f91aab6caebf42b3682945fbc35be",
        },
        config = function()
            local telescope = require "telescope"
            local actions = require "telescope.actions"
            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                pickers = {
                    live_grep = {
                        additional_args = function()
                            return { "--hidden" }
                        end,
                    },
                },
            }

            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
            vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files hidden=true<CR>")
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
            vim.keymap.set("n", "<leader>fS", "<cmd>Telescope live_grep hidden=true<CR>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

            telescope.load_extension "fzf"
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                },
            }
            require("telescope").load_extension "ui-select"
        end,
    },
}
