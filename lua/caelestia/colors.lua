local M = {}

function M.apply(colors)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "caelestia"

	-- Core UI highlights using Material Design 3 tokens
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.onBackground, bg = colors.background })
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.onSurface, bg = colors.surfaceContainer })
	vim.api.nvim_set_hl(0, "Comment", { fg = colors.subtext0, italic = true })
	vim.api.nvim_set_hl(0, "Constant", { fg = colors.peach })
	vim.api.nvim_set_hl(0, "String", { fg = colors.green })
	vim.api.nvim_set_hl(0, "Function", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "Keyword", { fg = colors.mauve })
	vim.api.nvim_set_hl(0, "Type", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Identifier", { fg = colors.flamingo })
	vim.api.nvim_set_hl(0, "Special", { fg = colors.pink })

	-- UI elements
	vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.surfaceContainerLow })
	vim.api.nvim_set_hl(0, "Visual", { bg = colors.surfaceContainerHigh })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.onSurface, bg = colors.surfaceContainer })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.onSurface, bg = colors.surfaceContainer })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.onPrimary, bg = colors.primary })
end

return M
