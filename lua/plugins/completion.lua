return {
    {
        "hrsh7th/nvim-cmp",
        version = "v0.0.1",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                version = "2.2.0",
                build = (function()
                    if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        commit = "dcd4a586439a1c81357d5b9d26319ae218cc9479",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                },
            },
            {
                "saadparwaiz1/cmp_luasnip",
                commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
            },
            {
                "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
                version = "v.0.0.1",
            },
            {
                "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
            },
            {
                "hrsh7th/cmp-path",
                commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
            },
            {
                "onsails/lspkind.nvim",
                commit = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf",
            },
        },
        config = function()
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            local lspkind = require "lspkind"

            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-space>"] = cmp.mapping.complete {}, -- show completion suggestion
                    ["<C-y>"] = cmp.mapping.confirm { select = false },
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },

                formatting = {
                    format = lspkind.cmp_format {
                        mode = "symbol_text",
                        menu = {
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        },
                        with_text = false,
                        maxwidth = 50,
                        ellipsis_char = "...",
                    },
                },
                experimental = {
                    ghost_text = true,
                },
            }
        end,
    },
    {
        "olexsmir/gopher.nvim",
        version = "v0.1.4",
        ft = "go",
        opts = {},
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
}
