return {
    "neovim/nvim-lspconfig",
    tag = "v0.1.7",
    dependencies = {
        {
            "williamboman/mason.nvim",
            version = "v1.10.0",
        },
        {
            "williamboman/mason-lspconfig.nvim",
            version = "v1.26.0",
        },
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            commit = "1212fb6082b7177dde17ea65e429e027835aeb40",
        },
        {
            "j-hui/fidget.nvim",
            opts = {},
        },
        {
            "folke/neodev.nvim",
            opts = {},
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- jump to the definition of the word under your cursor.
                --  to jump back, press <c-t>.
                map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")

                -- find references for the word under your cursor.
                map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")

                -- jump to the implementation of the word under your cursor.
                map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")

                -- jump to the type of the word under your cursor.
                --  the definition of its *type*, not where it was *defined*.
                map("<leader>D", require("telescope.builtin").lsp_type_definitions, "type [d]efinition")

                -- fuzzy find all the symbols in your current document.
                --  symbols are things like variables, functions, types, etc.
                map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")

                -- fuzzy find all the symbols in your current workspace
                --  similar to document symbols, except searches over your whole project.
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")

                -- rename the variable under your cursor
                --  most language servers support renaming across files, etc.
                map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")

                -- execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your lsp for this to activate.
                map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")

                -- opens a popup that displays documentation about the word under your cursor
                --  see `:help k` for why this keymap
                map("K", vim.lsp.buf.hover, "hover documentation")

                -- Goto Declaration.
                --  For example, in C this would take you to the header
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
        local util = require "lspconfig.util"

        local servers = {
            clangd = {},
            html = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            pyright = {},
            -- sourcekit = {
            --     cmd = {
            --         "/Applications/Xcode-15.0.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
            --     },
            --     root_dir = function(filename, _)
            --         return util.root_pattern "buildServer.json"(filename)
            --             or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
            --             or util.find_git_ancestor(filename)
            --             or util.root_pattern "Package.swift"(filename)
            --     end,
            -- },
            tsserver = {},
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua",
        })
        require("mason-tool-installer").setup { ensure_installed = ensure_installed }

        require("mason-lspconfig").setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        }
    end,
}
