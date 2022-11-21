local opt = vim.opt -- for conciseness

local options = {
    -- line numbers
    relativenumber = true,
    number = true,
    -- tabs & indentation
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 0,
    expandtab = true,
    smarttab = true,
    autoindent = true,
    -- line wrapping
    wrap = false,
    smartcase = true,
    -- cursor line
    cursorline = true,
    -- appearance
    termguicolors = true,
    background = "dark",
    signcolumn = "yes",
    -- backspace
    backspace = "indent,eol,start",
    -- split windows
    splitright = true,
    splitbelow = true,
}

for key, value in pairs(options) do
    opt[key] = value
end

-- clipboard
opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")
