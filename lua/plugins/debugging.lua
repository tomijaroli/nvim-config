return {
    {
        "mfussenegger/nvim-dap",
        version = "v0.7.0",
        dependencies = {
            {
                "williamboman/mason.nvim",
                version = "v1.10.0",
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                version = "v2.2.2",
            },
            {
                "rcarriga/nvim-dap-ui",
                version = "v4.0.0",
                dependencies = {
                    {
                        "nvim-neotest/nvim-nio",
                        version = "v1.8.1",
                    },
                },
            },
            {
                "leoluz/nvim-dap-go",
                commit = "64f73400761e2d19459e664a52ea478f3a4420e7",
            },
        },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            local masondap = require "mason-nvim-dap"
            local dapgo = require "dap-go"

            masondap.setup {
                automatic_setup = true,
                handlers = {},
                ensure_installed = { "delve" },
            }

            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
            end, { desc = "Debug: Set Breakpoint" })

            dapui.setup {
                icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
                controls = {
                    icons = {
                        pause = "⏸",
                        play = "▶",
                        step_into = "⏎",
                        step_over = "⏭",
                        step_out = "⏮",
                        step_back = "b",
                        run_last = "▶▶",
                        terminate = "⏹",
                        disconnect = "⏏",
                    },
                },
            }

            vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close

            dapgo.setup()
        end,
    },
}
