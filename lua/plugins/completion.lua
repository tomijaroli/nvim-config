return {
    { "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim's built-in LSP
    {
        "hrsh7th/cmp-buffer",   -- nvim-cmp source for buffer words
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
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
                    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
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
