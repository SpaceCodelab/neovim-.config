# Neovim Configuration

Personal Neovim setup using [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Structure](#structure)
- [Colorscheme](#colorscheme)
- [Dashboard](#dashboard)
- [Keybindings](#keybindings)
  - [General](#general)
  - [Dashboard](#dashboard-1)
  - [LSP](#lsp)
  - [Telescope](#telescope)
  - [Harpoon](#harpoon)
  - [Nvim Tree](#nvim-tree)
- [Plugins](#plugins)
- [LSP Servers](#lsp-servers)
- [Statusline](#statusline)

## Requirements

- Neovim **≥ 0.10**
- `git`
- `ripgrep` (`rg`) — required for Telescope live grep
- `fd` — required for Telescope find files
- `make` — for building telescope-fzf-native
- Nerd Font — for statusline icons and devicons

## Installation

```bash
git clone https://github.com/yourusername/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

On first launch, Lazy.nvim will bootstrap itself and install all plugins. Restart Neovim to apply.

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── lazy-lock.json            # Locked plugin versions
├── README.md
└── lua/
    ├── config/
    │   ├── lazy.lua           # Lazy.nvim bootstrap & setup
    │   ├── options.lua        # General editor options
    │   └── keybinds.lua       # Global keymaps
    └── plugins/
        ├── alpha.lua          # Startup dashboard
        ├── colors.lua         # Colorscheme (darkrose)
        ├── harpoon.lua        # Quick file navigation
        ├── lsp.lua            # LSP, mason, nvim-cmp, snippets
        ├── lualine.lua        # Statusline
        ├── nvim-tree.lua      # File explorer
        ├── oneliners.lua      # Misc plugins (fugitive, undotree, etc.)
        └── telescope.lua      # Fuzzy finder
```

## Colorscheme

- **Active:** [darkrose.nvim](https://github.com/water-sucks/darkrose.nvim)
- High visibility mode enabled
- Bold keywords, italic comments
- Transparent background disabled

## Dashboard

The startup dashboard (powered by [alpha-nvim](https://github.com/goolord/alpha-nvim)) features a Harry Potter themed ASCII art header with glasses and lightning bolt, a "You're a wizard, Neovimer" tagline, and a rotating Dumbledore quote in the footer. Vertical centering is dynamic — recalculates on window resize.

## Keybindings

### General

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<leader>cd` | Open Netrw Explorer |

### Dashboard

| Key | Action |
|-----|--------|
| `<leader>e` | New file (Alohomora!) |
| `<leader>f` | Find files (Accio File!) |
| `<leader>r` | Recent files (Prior Incantato) |
| `<leader>g` | Live grep (Legilimens!) |
| `<leader>c` | Open config (Chamber) |
| `<leader>q` | Quit (Avada Kedavra!) |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | Find references |
| `gs` | Signature help |
| `K` | Hover documentation |
| `gl` | Open diagnostic float |
| `<F2>` | Rename symbol |
| `<F3>` | Format buffer |
| `<F4>` | Code actions |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fo` | Recent files |
| `<leader>fr` | Resume last picker |
| `<leader>fg` | Live grep (search project) |
| `<leader>fs` | Grep word under cursor |
| `<leader>fq` | Quickfix list |
| `<leader>fi` | Find files in Neovim config |
| `<leader>fb` | Switch buffers |
| `<leader>fh` | Help tags |
| `<leader>gf` | Git files |
| `<leader>gc` | Git commits |
| `<leader>gs` | Git status |
| `<leader>sr` | LSP references |
| `<leader>sd` | Document symbols |
| `<leader>sw` | Workspace symbols |
| `<leader>si` | LSP implementations |
| `<leader>dd` | Document diagnostics |
| `<C-k>` / `<C-j>` | Move selection (previous/next) |
| `<C-q>` | Send to quickfix list |
| `<C-l>` | Toggle preview |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add file to Harpoon |
| `<C-e>` | Toggle Harpoon menu |
| `<leader>fl` | Telescope Harpoon picker |
| `<C-p>` | Go to previous Harpoon file |
| `<C-n>` | Go to next Harpoon file |

### Nvim Tree

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Focus file explorer |
| `<leader>+` | Increase width |
| `<leader>-` | Decrease width |

## Plugins

### Core

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [darkrose.nvim](https://github.com/water-sucks/darkrose.nvim) | Colorscheme |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Startup dashboard |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |

### LSP & Completion

| Plugin | Purpose |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason + lspconfig bridge |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer completion source |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion source |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet completion source |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Pre-built snippets |

### Fuzzy Finder

| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utilities (dependency) |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Native fzf sorter (faster) |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | Dropdown UI for vim.ui.select |

### File Navigation

| Plugin | Purpose |
|--------|---------|
| [harpoon](https://github.com/ThePrimeagen/harpoon) (harpoon2) | Quick file switching |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |

### Git

| Plugin | Purpose |
|--------|---------|
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git integration |
| [vim-oscyank](https://github.com/ojroques/vim-oscyank) | OSC52 clipboard (SSH) |

### Other

| Plugin | Purpose |
|--------|---------|
| [undotree](https://github.com/mbbill/undotree) | Visual undo history |
| [vim-doge](https://github.com/kkoomen/vim-doge) | Docblock generation |
| [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Color swatches (CSS hex, etc.) |
| [better-indent-support-for-php-with-html](https://github.com/captbaritone/better-indent-support-for-php-with-html) | PHP/HTML indentation |

## LSP Servers

Installed via Mason. Auto-configured on first use:

| Language | Server |
|----------|--------|
| Lua | `lua_ls` |
| C/C++ | `clangd` |
| Rust | `rust_analyzer` |
| Python | `pyright` |
| Markdown | `marksman` |

To install additional servers:

```
:Mason
```

## Statusline

Powered by [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) with a global statusbar (`globalstatus = true`).

### Sections

| Section | Content |
|---------|---------|
| `a` | Current mode (NORMAL/INSERT/VISUAL...) |
| `b` | Git branch + diff stats (added/modified/removed) |
| `c` | File path (relative) + fileformat + encoding + filetype + filesize |
| `x` | Current time + hostname |
| `y` | LSP diagnostics + search count + selection count |
| `z` | Cursor position (line:col) + file progress (%) |

### Extensions

Automatically adapts when using: nvim-tree, fugitive, mason, lazy.

---

_Generated from active configuration. Run `:Lazy` to manage plugins._
