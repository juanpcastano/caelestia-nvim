# caelestia-nvim

A Neovim color scheme plugin that automatically syncs with caelestia-shell and reloads in real-time when your theme changes. Keep your editor in perfect harmony with your desktop environment.

## Demo

https://github.com/user-attachments/assets/5db01d6e-9c98-4f82-8b00-3a397d6207a5

## Features

- **Automatic synchronization** - Reads color scheme directly from caelestia-shell
- **Real-time reloading** - Automatically updates when you change themes in caelestia-shell
- **Material Design 3 tokens** - Uses modern color system for consistent theming
- **LazyVim compatible** - Works seamlessly with LazyVim (but not required)
- **Cross-distro support** - Primarily designed for Arch Linux with Hyprland, but works on other distributions

## Requirements

- Neovim (version 0.7+ recommended for file watching support)
- [caelestia-shell](https://github.com/caelestia-dots/caelestia-shell) installed and configured
- File system event support (provided by Neovim's libuv integration)

## Installation

### Manual Installation

1. Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/yourusername/caelestia-nvim ~/.config/nvim/caelestia-nvim
```

2. Add the plugin to your Neovim configuration (`~/.config/nvim/init.lua` or `~/.config/nvim/init.vim`):

**For Lua configuration:**
```lua
vim.opt.runtimepath:prepend("~/.config/nvim/caelestia-nvim")
require("caelestia").setup()
```

**For Vimscript configuration:**
```vim
set runtimepath^=~/.config/nvim/caelestia-nvim
lua require("caelestia").setup()
```

Alternatively, if you're using a plugin manager structure, you can clone it to your plugins directory and add it to your runtimepath accordingly.

## How It Works

caelestia-nvim reads the color scheme from caelestia-shell's state file located at `$XDG_STATE_HOME/caelestia/scheme.json` (defaults to `~/.local/state/caelestia/scheme.json` if `XDG_STATE_HOME` is not set).

The plugin uses Neovim's built-in file system watcher (`vim.loop.new_fs_event()`) to monitor this file for changes. When caelestia-shell updates the theme, the plugin automatically:

1. Detects the file change
2. Reads the new color scheme
3. Applies the colors to Neovim's highlight groups
4. Notifies you that the theme has been reloaded

All color values are automatically formatted with the `#` prefix required by Neovim's highlight system.

## Configuration

The plugin works out of the box with no configuration required. Simply call `require("caelestia").setup()` in your Neovim configuration.

The setup function:
- Applies the current color scheme on startup
- Starts watching the scheme file for changes
- Automatically reloads when changes are detected

## Troubleshooting

### "No scheme file found" warning

This means caelestia-shell hasn't generated the scheme file yet, or it's located in a different path. Ensure:

1. caelestia-shell is installed and has been run at least once
2. The scheme file exists at `$XDG_STATE_HOME/caelestia/scheme.json` or `~/.local/state/caelestia/scheme.json`
3. You have read permissions for the file

### Theme not updating automatically

If the theme doesn't reload when you change it in caelestia-shell:

1. Check that file watching is supported on your system (most modern systems support this)
2. Verify the scheme file path is correct
3. Try manually reloading with `:lua require("caelestia").apply_colors()`

### File watching errors

If you see errors about file watching:

1. Ensure you're using Neovim 0.7 or later
2. Check that the scheme file path is valid and accessible
3. Verify your system supports file system events (Linux, macOS, and Windows all support this)

## License

MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

