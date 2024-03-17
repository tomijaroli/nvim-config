return {
    {
        "nvimtools/none-ls.nvim",
        commit = "72e25ed4162474ef5d666525853f8a42bffd97c5",
        dependencies = {
            {
                "nvimtools/none-ls-extras.nvim",
                commit = "c226aca7a506dd4325fb96188bffe804d24bbf18",
            },
        },
        config = function()
            local null_ls = require "null-ls"
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.rubocop,
                    null_ls.builtins.diagnostics.rubocop,
                    null_ls.builtins.formatting.prettier,
                    require "none-ls.diagnostics.eslint_d",
                },
                on_attach = function(current_client, bufnr)
                    if current_client.supports_method "textDocument/formatting" then
                        vim.api.nvim_clear_autocmds {
                            group = augroup,
                            buffer = bufnr,
                        }
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format {
                                    filter = function(client)
                                        return client.name == "null-ls"
                                    end,
                                    bufnr = bufnr,
                                }
                            end,
                        })
                    end
                end,
            }

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
        end,
    },
    {
        "jayp0521/mason-null-ls.nvim",
        version = "v2.5.1",
        ensure_installed = { "prettier", "stylua", "swift-mesonlsp", "yamlls" },
    },
    {
        "gennaro-tedesco/nvim-jqx",
        version = "v0.1.3",
        ft = { "json" },
    },
}
