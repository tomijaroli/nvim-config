return {
    {
        "mfussenegger/nvim-dap",
        version = "v0.7.0",
        dependencies = {
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
            local dap, dapui, dapgo = require "dap", require "dapui", require "dap-go"
            dapui.setup()
            dapgo.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue Running" })
        end,
    },
}
