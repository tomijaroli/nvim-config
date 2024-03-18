vim.cmd "autocmd!"
local opt = vim.opt -- for conciseness

local options = {
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    mouse = "a", -- allow the mouse to be used in neovim
    showmode = false, -- no need to show mode, there's a statusline already
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    breakindent = true,
    undofile = true,
    ignorecase = true, -- ignore case in search patterns
    smartcase = true, -- smart case
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    updatetime = 250, -- faster completion
    timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    splitright = true, -- force all vertical splits to go to the right of current window
    splitbelow = true, -- force all horizontal splits to go below current window
    list = true,
    listchars = { tab = "» ", trail = "·", nbsp = "␣" },
    inccommand = "split",
    cursorline = true, -- highlight the current line
    scrolloff = 10,
    hlsearch = true, -- highlight all matches on previous search pattern
    termguicolors = true, -- set term gui colors (most terminals support this)
    sidescrolloff = 8,
    title = true,
    backspace = "indent,eol,start",
    pumblend = 10,
    fcs = "eob: ",
}

for key, value in pairs(options) do
    opt[key] = value
end

local appends = {
    -- path = { "**" },
    iskeyword = "-",
}

for key, value in pairs(appends) do
    opt[key]:append(value)
end

vim.wo.number = true

opt.fillchars.eob = " "

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
