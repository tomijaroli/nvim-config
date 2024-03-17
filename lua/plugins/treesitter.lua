return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter.configs"
        configs.setup {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        }

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
    end,
}
