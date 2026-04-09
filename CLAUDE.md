# Neovim Configuration (nvim-lua-config)

This is a personal Neovim configuration written in Lua, maintained under the namespace `sudokid`.

## Structure

- `init.lua` — entry point, loads `sudokid` module
- `lua/sudokid/init.lua` — loads all submodules in order
- `lua/sudokid/set.lua` — vim options (tabs, search, UI)
- `lua/sudokid/remap.lua` — global keymaps
- `lua/sudokid/packer.lua` — plugin declarations via packer.nvim
- `lua/sudokid/mason.lua` — Mason LSP installer setup
- `lua/sudokid/lsp/` — LSP configuration (setup.lua, htmx.lua)
- `lua/sudokid/dap/` — Debug Adapter Protocol configs (go, rust, zig, javascript, dap_ui, remap)
- `lua/sudokid/harpoon.lua` — Harpoon file navigation
- `lua/sudokid/colorscheme.lua` — color theme (kanagawa)
- `lua/sudokid/mini.lua` — mini.nvim utilities
- `lua/sudokid/quick_esc.lua` — quick escape mapping
- `lua/sudokid/user_defined_fn.lua` — custom utility functions
- `after/plugin/` — plugin-specific configs loaded after plugins (telescope, treesitter, undotree, material)

## Plugin Manager

Uses **packer.nvim** (`wbthomason/packer.nvim`).

## Key Plugins

- **Telescope** — fuzzy finder, file/grep search, LSP integration
- **Treesitter** — syntax highlighting and context
- **LSP** — via `nvim-lspconfig` + `mason.nvim` + `lsp-zero` (v2.x) + `nvim-cmp`
- **DAP** — nvim-dap with adapters for Go, Rust, Zig, JavaScript
- **Harpoon** — quick file switching
- **Oil.nvim** — file manager
- **Kanagawa** — color scheme
- **vim-fugitive** + **vim-gitgutter** — Git integration
- **mini.nvim** — misc utilities
- **Taboo** — named tabs

## Key Keymaps

- `<leader>` = `Space`
- `<leader>e` — open Oil (file manager)
- `<leader>ff` — Telescope find files
- `<leader>fg` — Telescope git files
- `<leader>pf` — live grep (all files)
- `<C-j>` / `<C-k>` — previous / next tab
- `<C-f>` — LSP format
- `<C-s>` — save file
- `<leader>r` — rename word under cursor (sed-style)
- `gd` — go to definition (Telescope LSP)
- `gr` — go to references (Telescope LSP)
- `]e` / `[e` — next / prev diagnostic
- `]q` / `[q` — next / prev quickfix
- `<leader>T` — open terminal in vertical split
- `<leader>y` — yank to system clipboard (visual)

## Conventions

- All Lua config lives under the `sudokid` namespace
- Plugin-specific setup goes in `after/plugin/`
- DAP adapters each have their own file under `lua/sudokid/dap/`
- Indentation: 2 spaces (expandtab)
- No trailing summaries needed in responses — keep changes focused and minimal
