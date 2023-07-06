local M = {}

M.set = function(colorscheme, style, transparent)
	local module = string.format("plugins.theme.%s", colorscheme)

	local status_ok, theme = pcall(require, module)
	if not status_ok then
		return
	end

	theme.setup(style, transparent)
	theme.load()
end

return M
