return {
    {
        "stevearc/conform.nvim",
        version = "v5.4.0",
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            -- TODO: fix ruby formatting and add swift
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { { "prettierd", "prettier" } },
                python = { "isort", "black" },
                ruby = { "rubocop" },
                yaml = { "yamlls" },
            },
        },
    },
    {
        "gennaro-tedesco/nvim-jqx",
        version = "v0.1.3",
        ft = { "json" },
    },
}
