local M = {}

local handle = nil

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

  local scheme = vim.json.decode(content)

  -- Prepend # to all color values
  local colors = {}
  for name, value in pairs(scheme.colours) do
    colors[name] = "#" .. value
  end

  return colors
end

function M.apply_colors()
  local colors = read_scheme()
  if not colors then
    vim.notify("Caelestia: No scheme file found", vim.log.levels.WARN)
    return
  end

  require("caelestia.colors").apply(colors)
end

function M.setup(opts)
  -- Apply colors on startup
  M.apply_colors()

  -- Watch for file changes if not already watching
  if handle then
    return
  end

  local scheme_path = get_scheme_path()
  handle = vim.loop.new_fs_event()

  -- Start watching the file
  handle:start(scheme_path, {}, vim.schedule_wrap(function(err, filename, events)
    if err then
      vim.notify("Caelestia: Error watching scheme file: " .. err, vim.log.levels.ERROR)
      return
    end

    -- Reload colors when file changes
    M.apply_colors()
    vim.notify("Caelestia: Theme reloaded", vim.log.levels.INFO)
  end))
end

return M
