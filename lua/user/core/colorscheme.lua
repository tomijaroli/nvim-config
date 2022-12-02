local status, _ = pcall(vim.cmd, "colorscheme nightfox") -- best themes: nightfox, tender, gruvbox, terafox, tokyonight, nord
if not status then
    print "Colorscheme not found!"
    return
end
