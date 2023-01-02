vim.cmd "autocmd!"
local opt = vim.opt -- for conciseness

local options = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 100, -- faster completion (4000ms default)
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    softtabstop = 0,
    smarttab = true,
    cursorline = true, -- highlight the current line
    autoindent = true,
    number = true, -- set numbered lines
    laststatus = 3,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    breakindent = true,
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    title = true,
    backspace = "indent,eol,start",
    shell = "zsh",
    inccommand = "split",
    wildoptions = "pum",
    pumblend = 10,
}

for key, value in pairs(options) do
    opt[key] = value
end

local appends = {
    shortmess = "c",
    path = { "**" },
    clipboard = "unnamedplus",
    iskeyword = "-",
}

for key, value in pairs(appends) do
    opt[key]:append(value)
end

vim.scriptencoding = "utf-8"
vim.wo.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.fillchars.eob = " "

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- vim.highlight.create("Comment", { cterm = "italic", gui = "italic" }, true)

function setTransparency()
    vim.cmd [[ highlight Normal ctermbg=NONE guibg=NONE ]]
    vim.cmd [[ highlight NoText ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE ]]
    vim.cmd [[ highlight EndOfBuffer ctermbg=NONE guibg=NONE ]]
    vim.cmd [[ highlight EndOfFile ctermbg=NONE guibg=NONE ]]
    vim.cmd [[ highlight LineNr guibg=none ctermbg=none ]]
    vim.cmd [[ highlight Folded guibg=none ctermbg=none ]]
    vim.cmd [[ highlight SpecialKey guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ highlight VertSplit guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ highlight SignColumn guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ highlight StatusLine ctermbg=NONE guibg=NONE ]]
    vim.cmd [[ highlight LuaLine ctermbg=NONE guibg=NONE ]]
    vim.cmd [[ highlight NvimTreeNormal guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE ]]
end

function clearBackgrounds()
    setTransparency()

    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "*" },
        callback = function()
            setTransparency()
        end,
    })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        clearBackgrounds()
    end,
})
