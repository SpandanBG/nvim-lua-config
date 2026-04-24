# nvim-lua-config

Personal Neovim configuration written in Lua. Requires **Neovim 0.12+**.

---

## Prerequisites

```bash
# macOS
brew install ripgrep fd fzf node

# Ubuntu/Debian
sudo apt install ripgrep fd-find fzf nodejs npm
```

- **Rust** — install via [rustup](https://www.rust-lang.org/tools/install)
- **Zig** — install via [ziglang.org](https://ziglang.org/download)
- **Go** — install via [go.dev](https://go.dev/dl)
- **tree-sitter CLI** — required to compile treesitter parsers: `cargo install tree-sitter-cli` (note: `brew install tree-sitter` only installs the library, not the CLI)
- **codelldb** and **cpptools** — install via `:Mason` (required for Rust/Zig DAP)
- **js-debug-adapter** — install via `:Mason` (required for JavaScript/TypeScript DAP)
- Undo history directory: `mkdir -p ~/.vim/undodir`

---

## Keymaps

`<leader>` = `Space`

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | n | Open file manager (Oil) |
| `<C-s>` | n | Save file |
| `<C-f>` | n | LSP format |
| `<leader>T` | n | Open terminal in vertical split |
| `<leader><ESC>` | t | Exit terminal |
| `<ESC>` | t | Exit terminal mode (keep window) |

### Search (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Find git-tracked files |
| `<leader>pf` | n | Live grep all files (ripgrep, supports args) |
| `<leader>gf` | n | Live grep git files only |
| `<leader>cf` | n | Live grep current file |
| `<C-h>` | i/n | (Inside Telescope) Add selected file(s) to Harpoon — use `<Tab>` to multi-select first |

### Harpoon

| Key | Mode | Action |
|-----|------|--------|
| `<F1>` | n | Add current file to Harpoon |
| `<leader>hh` | n | Open Harpoon list in Telescope picker |
| `<leader>[` | n | Navigate to previous Harpoon file |
| `<leader>]` | n | Navigate to next Harpoon file |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `K` | n | Hover documentation |
| `gs` | n | Signature help |
| `gd` | n | Go to definition (Telescope) |
| `gr` | n | Go to references (Telescope) |
| `gi` | n | Go to implementation |
| `go` | n | Go to type definition |
| `gD` | n | Go to declaration |
| `gl` | n | Open diagnostics float |
| `<F2>` | n | Rename symbol |
| `]e` | n | Next diagnostic |
| `[e` | n | Previous diagnostic |

### DAP (Debugger)

| Key | Mode | Action |
|-----|------|--------|
| `<F3>` | n | Toggle breakpoint |
| `<leader><F3>` | n | Set conditional breakpoint |
| `<F4>` | n | Clear all breakpoints |
| `<F5>` | n | Re-run last debug session |
| `<F6>` | n | Continue / start debugging |
| `<F7>` | n | Terminate session |
| `<F8>` | n | Debug Go test (cursor on test function) |
| `<F9>` | n | Step over |
| `<F10>` | n | Step into |
| `<F11>` | n | Step out |
| `<leader>=` | n | Toggle DAP UI |

### Tabs

| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | n | Previous tab |
| `<C-k>` | n | Next tab |
| `<leader>tt` | n | Open new named tab (Taboo) |
| `<leader>tr` | n | Rename current tab (Taboo) |

### Editing

| Key | Mode | Action |
|-----|------|--------|
| `<leader>y` | v | Yank to system clipboard |
| `<leader>p` | x | Paste over selection without overwriting register |
| `J` | v | Move selected lines down |
| `K` | v | Move selected lines up |
| `n` / `N` | n | Search next/prev (keeps result centred) |
| `<leader>r` | n | Rename word under cursor (project-wide, with confirm) |
| `<leader>cp` | n | Copy relative file path to clipboard |
| `<C-f>` | n | Format file via LSP |
| `Q` | n | Disabled (prevents accidental Ex mode) |
| `gcc` | n | Toggle comment on line |
| `gc` | v | Toggle comment on selection |

### Quickfix

| Key | Mode | Action |
|-----|------|--------|
| `<leader>oq` | n | Open quickfix list |
| `<leader>cq` | n | Clear quickfix list |
| `]q` | n | Next quickfix item |
| `[q` | n | Previous quickfix item |

### Surround (mini.surround)

| Key | Action |
|-----|--------|
| `sa` | Add surrounding |
| `sd` | Delete surrounding |
| `sr` | Replace surrounding |
| `sf` / `sF` | Find surrounding (right / left) |
| `sh` | Highlight surrounding |

### Misc

| Key | Mode | Action |
|-----|------|--------|
| `<leader>u` | n | Toggle undo tree |
| `:Cppath` | cmd | Copy absolute file path to clipboard |
| `:InspectTree` | cmd | Show treesitter syntax tree (built-in, replaces playground) |

---

## Language-specific: DAP Requirements

### Rust
- Install `codelldb` via `:Mason`
- Install `cpptools` via `:Mason`
- `cargo` must be on `$PATH`
- Two debug configs available: **Debug Test** (builds with `--tests`) and **Debug Bin**

### Zig
- Install `codelldb` via `:Mason` (shared with Rust)
- `zig` must be on `$PATH`
- Builds via `zig build` / `zig build test` and picks the newest binary from `zig-out/bin`

### Go
- Install `delve` via `:Mason` (or `go install github.com/go-delve/delve/cmd/dlv@latest`)
- `<F8>` runs the Go test function under the cursor

### JavaScript / TypeScript
- Install `js-debug-adapter` via `:Mason`
- The adapter is served on port `9229` via Node
- Debug configs available: Vitest, Jest, Launch file, Attach to process, Chrome

### LSP (auto-installed via Mason)
- `ts_ls` — TypeScript/JavaScript
- `rust_analyzer` — Rust
- `gopls` — Go
- `lua_ls` — Lua

To install additional LSPs: `:Mason`

---

## Plugin Management (vim.pack — built-in, Neovim 0.12+)

Plugins are declared in `lua/sudokid/pack.lua` and managed by Neovim's built-in `vim.pack`.

```
# Update all plugins
:lua vim.pack.update()

# Remove a plugin
# 1. Delete it from pack.lua
# 2. :lua vim.pack.del('plugin-name')
```

A lockfile is maintained at `~/.config/nvim/nvim-pack-lock.json` — commit it to pin versions.

### Updating Treesitter Parsers

After updating nvim-treesitter, run:
```
:TSUpdate
```
This also runs automatically via `PackChanged` hook when nvim-treesitter is installed or updated.

To install parsers for new languages:
```
:TSInstall <lang>
```

---

## Platform-specific Notes

### macOS — Option/Alt key

`<M-x>` mappings (Alt key) do not work by default in terminal emulators on macOS. Configure your terminal to send `Option` as `Alt`:

**Alacritty** (`~/.config/alacritty/alacritty.toml`):
```toml
[window]
option_as_alt = "Both"
```

**iTerm2**: Preferences → Profiles → Keys → Left Option Key → `Esc+`

### macOS — Clipboard

System clipboard (`"+y`, `<leader>y`) requires `pbcopy`/`pbpaste`, which are available by default on macOS. On Linux, install `xclip` or `xsel`.

### Linux — fd

On Debian/Ubuntu, `fd` is packaged as `fd-find`. If Telescope can't find files, symlink it:
```bash
ln -s $(which fdfind) ~/.local/bin/fd
```

---

## Troubleshooting

**Undo tree: "unable to save undo file"**
The `~/.vim/undodir` directory doesn't exist or has wrong ownership:
```bash
mkdir -p ~/.vim/undodir
sudo chown -R $USER ~/.vim/undodir
```

**DAP UI doesn't open automatically**
The UI opens automatically on session start via `dap.listeners`. If it doesn't appear, toggle manually with `<leader>=`.

**LSP not attaching**
Run `:Mason` and verify the relevant language server is installed. Run `:checkhealth lsp` for diagnostics.

**Treesitter errors on startup**
Run `:TSUpdate` to refresh parsers. Run `:checkhealth nvim-treesitter` for a status report.
