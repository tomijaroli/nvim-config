return {
    {
        "tpope/vim-surround",
        commit = "3d188ed2113431cf8dac77be61b842acb64433d9",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        version = "v3.5.4",
        opts = {},
    },
    {
        "windwp/nvim-autopairs",
        commit = "c6139ca0d5ad7af129ea6c89cb4c56093f2c034a",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0,
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        },
        config = function(_, opts)
            local autopairs = require "nvim-autopairs"
            autopairs.setup(opts)

            if not vim.g.autopairs_enabled then
                autopairs.disable()
            end

            local cmp_autopairs_setup, cmp = pcall(require, "cmp")
            if cmp_autopairs_setup then
                cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
            end
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        commit = "531f48334c422222aebc888fd36e7d109cb354cd",
    },
    {
        "numToStr/Comment.nvim",
        version = "v0.8.0",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        version = "v1.1.0",
        opts = {},
    },
    {
        "norcalli/nvim-colorizer.lua",
        commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "vim-scripts/ReplaceWithRegister",
        tag = "1.42",
    },
}
