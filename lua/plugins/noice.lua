return {
    "folke/noice.nvim",
    version = "v2.0.0",
    event = "VeryLazy",
    dependencies = {
        {
            "rcarriga/nvim-notify",
            version = "v3.13.4",
            opts = {
                background_colour = "#000000",
            },
        },
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
    },
}
