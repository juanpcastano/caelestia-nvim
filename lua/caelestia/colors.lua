local M = {}

function M.apply(colors)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "caelestia"

	-- Core UI
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.onBackground, bg = colors.background })
	vim.api.nvim_set_hl(0, "NormalNC", { fg = colors.onBackground, bg = colors.background })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.outline, bg = colors.surfaceContainer })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.background })
	vim.api.nvim_set_hl(0, "FoldColumn", { bg = colors.background })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.surface, bg = colors.background })

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
	vim.api.nvim_set_hl(0, "Visual", { fg = colors.onPrimary, bg = colors.primary })
	vim.api.nvim_set_hl(0, "VisualNOS", { fg = colors.onSurface, bg = colors.surfaceContainerHigh })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.onSurface, bg = colors.surfaceContainer })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.onPrimary, bg = colors.primary })

	-- StatusLine — usados por lualine theme = 'auto' (sin bg para transparencia central)
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.onSurface })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.subtext0 })

	-- Diagnostics
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.teal })

	-- Git
	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red })
	vim.api.nvim_set_hl(0, "diffAdded", { fg = colors.green })
	vim.api.nvim_set_hl(0, "diffChanged", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "diffRemoved", { fg = colors.red })

	-- Neo-tree cursor
	vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = colors.surfaceContainerHigh })

	-- Neo-tree
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = colors.onBackground, bg = colors.background })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = colors.onBackground, bg = colors.background })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = colors.surface, bg = colors.background })
	vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.primary, bold = true })
	vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.onBackground })
	vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = colors.primary })
	vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.outline })
	vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = colors.outline })
	vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = colors.teal })
	vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = colors.outline })
	vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = colors.primary, bold = true })
	vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = colors.onPrimary, bg = colors.primary })
	vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.green })
	vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.red })
	vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.peach })
	vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = colors.subtext0 })
	vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = colors.red, bold = true })
end

return M
