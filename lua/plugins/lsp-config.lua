return {
    {
        "williamboman/mason.nvim",
        version = "v1.10.0",
        config = function()
            require("mason").setup {
                PATH = "prepend",
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "v1.26.0",
        lazy = false,
        opts = {
            auto_install = true,
        },
        ensure_installed = {
            "tsserver",
            "html",
            "cssls",
            "lua_ls",
            "clangd",
            "cmake",
            "dockerls",
            "emmet_ls",
            "jsonls",
            "kotlin_language_server",
            "ruby_ls",
            "pyright",
            "yamlls",
        },
    },
    {
        "neovim/nvim-lspconfig",
        tag = "v0.1.7",
        config = function()
            local lspconfig = require "lspconfig"
            local util = require "lspconfig.util"
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }
            lspconfig.html.setup {
                capabilities = capabilities,
            }
            lspconfig.tsserver.setup {
                capabilities = capabilities,
            }
            lspconfig.sourcekit.setup {
                capabilities = capabilities,
                cmd = {
                    "/Applications/Xcode-15.0.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
                },
                root_dir = function(filename, _)
                    return util.root_pattern "buildServer.json"(filename)
                        or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
                        or util.find_git_ancestor(filename)
                        or util.root_pattern "Package.swift"(filename)
                end,
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.stdpath "config" .. "/lua"] = true,
                            },
                        },
                    },
                },
            }

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
            vim.keymap.set("n", "gF", "<cmd>Lspsaga lsp_finder<CR>", opts)
            vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
            vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
            vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
            vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
            vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
            vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
        end,
    },
}
