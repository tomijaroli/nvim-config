local status, markdown = pcall(require, "markdown-preview")
if not status then
	return
end

markdown.setup()
