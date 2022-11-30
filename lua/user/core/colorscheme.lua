local status, _ = pcall(vim.cmd, "colorscheme one-monokai")
if not status then
    print "Colorscheme not found!"
    return
end
