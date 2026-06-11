local M = {}

local handle = nil
local debounce_timer = nil

local function get_scheme_path()
	local xdg_state = os.getenv("XDG_STATE_HOME") or (os.getenv("HOME") .. "/.local/state")
	return xdg_state .. "/caelestia/scheme.json"
end

local function read_scheme()
	local scheme_path = get_scheme_path()
	local file = io.open(scheme_path, "r")
	if not file then
		return nil
	end

	local content = file:read("*all")
	file:close()

	if not content or #content == 0 then
		return nil
	end

	local ok, scheme = pcall(vim.json.decode, content)
	if not ok then
		return nil
	end

	local colors = {}
	for name, value in pairs(scheme.colours) do
		colors[name] = "#" .. value
	end

	return colors
end

function M.apply_colors()
	local colors = read_scheme()
	if not colors then
		return
	end

	require("caelestia.colors").apply(colors)
end

local function restore_transparency()
	local ok, transparent = pcall(require, "transparent")
	if ok then
		transparent.clear()
	end
end

local function refresh_plugins()
	restore_transparency()
	vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })
end

local function reload()
	M.apply_colors()
	refresh_plugins()
	vim.notify("Caelestia: Theme reloaded", vim.log.levels.INFO)
end

function M.setup()
	M.apply_colors()
	refresh_plugins()

	if handle then
		return
	end

	local scheme_path = get_scheme_path()
	handle = vim.loop.new_fs_event()

	handle:start(
		scheme_path,
		{},
		vim.schedule_wrap(function(err, filename, events)
			if err then
				vim.notify("Caelestia: Error watching scheme file: " .. err, vim.log.levels.ERROR)
				return
			end

			if debounce_timer then
				pcall(debounce_timer.close, debounce_timer)
				debounce_timer = nil
			end
			debounce_timer = vim.defer_fn(reload, 150)
		end)
	)
end

return M
