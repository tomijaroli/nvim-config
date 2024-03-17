return {
    {
        "iamcco/markdown-preview.nvim",
        version = "v0.0.10",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            local status, markdown = pcall(require, "markdown-preview")
            if not status then
                print "Markdown Preview not found"
                return
            end

            markdown.setup()
        end,
    },
}
