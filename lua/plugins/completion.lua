return {
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
        "L3MON4D3/LuaSnip",
        version = "2.2.0",
        dependencies = {
            {
                "saadparwaiz1/cmp_luasnip",
                commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
            },
            {
                "rafamadriz/friendly-snippets",
                commit = "dcd4a586439a1c81357d5b9d26319ae218cc9479",
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        version = "v0.0.1",
        dependencies = {
            {
                "onsails/lspkind.nvim",
                commit = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf",
            },
        },
        config = function()
            local cmp = require "cmp"
            local lspkind = require "lspkind"
            require("luasnip.loaders.from_vscode").lazy_load()

            vim.opt.completeopt = "menu,menuone,noselect"
            vim.cmd [[
                highlight! default link CmpItemKind CmpItemMenuDefault
            ]]

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-space>"] = cmp.mapping.complete(), -- show completion suggestion
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
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
            }
        end,
    },
}
