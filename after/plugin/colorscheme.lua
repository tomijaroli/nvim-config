local status, _ = pcall(vim.cmd, "colorscheme catppuccin-macchiato") -- best themes: nightfox, tender, gruvbox, terafox, tokyonight, nord
if not status then
    print "Colorscheme not found!"
    return
end

vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_bold = 0
