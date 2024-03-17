return {
    "folke/which-key.nvim",
    version = "v1.6.0",
    config = function()
        local which_key = require "which-key"
        which_key.setup()
    end,
}
