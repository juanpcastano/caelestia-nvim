# caelestia-nvim

A Neovim color scheme plugin that automatically syncs with [caelestia-shell](https://github.com/caelestia-dots/caelestia-shell) and reloads in real-time when your theme changes. Keep your editor in perfect harmony with your desktop environment.

## Demo

https://github.com/user-attachments/assets/5db01d6e-9c98-4f82-8b00-3a397d6207a5

## Features

- **Automatic synchronization** - Reads color scheme directly from caelestia-shell.
- **Real-time reloading** - Automatically updates when you change themes in caelestia-shell.
- **Idempotent Setup** - Safe to call multiple times; manages file watchers internally.
- **Material Design 3 tokens** - Uses modern color system for consistent theming.
- **LazyVim / lazy.nvim compatible** - Optimized for modern plugin managers.

## Requirements

- Neovim 0.7+ (for file watching support)
- [caelestia-shell](https://github.com/caelestia-dots/caelestia-shell) installed and configured
- File system event support (standard on most Linux/macOS/Windows systems)

## Installation

### For LazyVim / lazy.nvim (Recommended)

1. Clone this repository:
```bash
git clone https://github.com/atdma/caelestia-nvim
cd caelestia-nvim
```
2. Run the automated installer:
```bash
./install_lazyvim.sh
```
This script will create a specification in your `lua/plugins` directory and configure LazyVim to use `caelestia` as your primary colorscheme.

### For Standard Neovim (non-lazy)

1. Clone and run the standard installer:
```bash
git clone https://github.com/atdma/caelestia-nvim
cd caelestia-nvim
./install.sh
```
2. Add the setup call to your `init.lua`:
```lua
require("caelestia").setup()
```

### Manual Configuration (lazy.nvim)

If you prefer to configure it manually, add this to your plugin specs:

```lua
{
  "atdma/caelestia-nvim",
  priority = 1000, -- Load before other plugins
  lazy = false,    -- Load on startup
  opts = {},       -- Automatically calls require("caelestia").setup()
  config = function(_, opts)
    require("caelestia").setup(opts)
    vim.cmd.colorscheme("caelestia")
  end,
}
```

## How It Works

The plugin monitors `$XDG_STATE_HOME/caelestia/scheme.json` using Neovim's built-in file system watcher. 

- **Sync**: It maps Material Design 3 tokens to Neovim highlight groups.
- **Watch**: It uses a single, persistent watcher. If `setup()` is called again (e.g., during a manual reload), it safely reuses the existing watcher.
- **Recognition**: It correctly sets `vim.g.colors_name`, allowing statusline plugins and other integrations to recognize the active theme.

## Troubleshooting

- **"No scheme file found"**: Ensure `caelestia-shell` has been run at least once to generate the state file at `~/.local/state/caelestia/scheme.json`.
- **Theme not updating**: Verify your system supports file system events and that you are using Neovim 0.7+.

## License

MIT License - Copyright (c) 2026 atdma
