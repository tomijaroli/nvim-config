return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        event = "VimEnter",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                commit = "f7adfc4b3f4f91aab6caebf42b3682945fbc35be",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                commit = "9ef21b2e6bb6ebeaf349a0781745549bbb870d27",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            {
                "nvim-telescope/telescope-ui-select.nvim",
                commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
            },
            {
                "nvim-tree/nvim-web-devicons",
                commit = "cb0c967c9723a76ccb1be0cc3a9a10e577d2f6ec",
                enabled = vim.g.have_nerd_font,
            },
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            }

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sF", "<cmd>Telescope find_files hidden=true<CR>")
            vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set(
                "n",
                "<leader>sG",
                "<cmd>Telescope live_grep hidden=true<CR>",
                { desc = "[S]earch by [G]rep including hidden" }
            )
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end, { desc = "[S]earch [/] in Open Files" })

            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end, { desc = "[S]earch [N]eovim files" })
        end,
    },
}
