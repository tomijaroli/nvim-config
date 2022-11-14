local status, markdown = pcall(require, "markdown-preview")
if not status then
	return
end

vim.g.mkdp_auto_start = 1

markdown.setup()
