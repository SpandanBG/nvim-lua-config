# Graph Report - .  (2026-04-27)

## Corpus Check
- Corpus is ~5,117 words - fits in a single context window. You may not need a graph.

## Summary
- 108 nodes · 120 edges · 32 communities detected
- Extraction: 85% EXTRACTED · 14% INFERRED · 1% AMBIGUOUS · INFERRED: 17 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Plugin Manager and LSP Stack|Plugin Manager and LSP Stack]]
- [[_COMMUNITY_DAP Core and UI|DAP Core and UI]]
- [[_COMMUNITY_Harpoon + Telescope Integration|Harpoon + Telescope Integration]]
- [[_COMMUNITY_Core Initialization|Core Initialization]]
- [[_COMMUNITY_RustZig DAP Adapters|Rust/Zig DAP Adapters]]
- [[_COMMUNITY_Docs and Rationale|Docs and Rationale]]
- [[_COMMUNITY_LSP Configuration|LSP Configuration]]
- [[_COMMUNITY_Statusline (Lualine)|Statusline (Lualine)]]
- [[_COMMUNITY_Plugin Declarations|Plugin Declarations]]
- [[_COMMUNITY_Harpoon Module|Harpoon Module]]
- [[_COMMUNITY_Zig DAP Module|Zig DAP Module]]
- [[_COMMUNITY_Rust DAP Module|Rust DAP Module]]
- [[_COMMUNITY_Entry Point|Entry Point]]
- [[_COMMUNITY_Sudokid Init|Sudokid Init]]
- [[_COMMUNITY_Vim Options|Vim Options]]
- [[_COMMUNITY_User Functions|User Functions]]
- [[_COMMUNITY_Global Keymaps|Global Keymaps]]
- [[_COMMUNITY_Mini.nvim Module|Mini.nvim Module]]
- [[_COMMUNITY_Quick Escape|Quick Escape]]
- [[_COMMUNITY_Mason Module|Mason Module]]
- [[_COMMUNITY_LSP Init|LSP Init]]
- [[_COMMUNITY_HTMX LSP|HTMX LSP]]
- [[_COMMUNITY_LSP Setup|LSP Setup]]
- [[_COMMUNITY_DAP Init|DAP Init]]
- [[_COMMUNITY_JS DAP Module|JS DAP Module]]
- [[_COMMUNITY_Go DAP Module|Go DAP Module]]
- [[_COMMUNITY_DAP UI Module|DAP UI Module]]
- [[_COMMUNITY_DAP Keymaps|DAP Keymaps]]
- [[_COMMUNITY_Material Theme (disabled)|Material Theme (disabled)]]
- [[_COMMUNITY_Treesitter Config|Treesitter Config]]
- [[_COMMUNITY_Undotree Config|Undotree Config]]
- [[_COMMUNITY_Undotree Plugin|Undotree Plugin]]

## God Nodes (most connected - your core abstractions)
1. `pack.lua Plugin Manager (vim.pack)` - 28 edges
2. `sudokid/init.lua Module Loader` - 11 edges
3. `DAP Init (Orchestrator)` - 8 edges
4. `Plugin: nvim-dap` - 6 edges
5. `nvim-lua-config README` - 6 edges
6. `mason.lua LSP Installer Setup` - 5 edges
7. `lsp/setup.lua LSP Keymaps and CMP Setup` - 5 edges
8. `Plugin: telescope.nvim` - 5 edges
9. `Plugin: nvim-dap-go` - 5 edges
10. `remap.lua Global Keymaps` - 4 edges

## Surprising Connections (you probably didn't know these)
- `vim.pack Built-in Plugin Manager (Neovim 0.12)` --rationale_for--> `Plugin: telescope.nvim`  [INFERRED]
  CLAUDE.md → lua/sudokid/pack.lua
- `Material Colorscheme Config (disabled)` --conceptually_related_to--> `Plugin: telescope.nvim`  [AMBIGUOUS]
  after/plugin/material.lua → lua/sudokid/pack.lua
- `nvim-lua-config README` --references--> `Plugin: nvim-dap-go`  [EXTRACTED]
  README.md → lua/sudokid/pack.lua
- `nvim-lua-config README` --references--> `codelldb (Mason-installed DAP adapter)`  [EXTRACTED]
  README.md → lua/sudokid/dap/zig.lua
- `nvim-lua-config README` --references--> `js-debug-adapter (Mason)`  [EXTRACTED]
  README.md → lua/sudokid/dap/javascript.lua

## Hyperedges (group relationships)
- **LSP Stack: mason + lspconfig + cmp** — mason_lsp_installer, lsp_setup_keymaps, lsp_setup_cmp_config, plugin_mason, plugin_mason_lspconfig, plugin_lspconfig, plugin_nvim_cmp, plugin_cmp_nvim_lsp [INFERRED 0.90]
- **DAP Stack: nvim-dap + adapters + UI** — plugin_nvim_dap, plugin_dap_go, plugin_dap_vscode_js, plugin_dap_ui, plugin_dap_virtual_text, plugin_telescope_dap [INFERRED 0.85]
- **Harpoon + Telescope Integration** — harpoon_setup, harpoon_telescope_picker, plugin_harpoon2, plugin_telescope [EXTRACTED 1.00]
- **Module Load Order: pack before mason/lsp** — pack_plugin_manager, mason_lsp_installer, lsp_init_loader [EXTRACTED 1.00]
- **Git Integration: gitsigns + fugitive** — plugin_gitsigns, plugin_fugitive [INFERRED 0.80]
- **DAP Language Adapter Modules (Rust, Zig, Go, JS)** — dap_rust, dap_zig, dap_go, dap_javascript [EXTRACTED 1.00]
- **codelldb Adapter Shared by Rust and Zig** — dap_zig_codelldb_adapter, dap_rust_codelldb_adapter, plugin_codelldb [INFERRED 0.85]
- **Telescope-Harpoon Integration (add_to_harpoon action)** — telescope_add_to_harpoon, plugin_harpoon, plugin_telescope [EXTRACTED 1.00]
- **Full DAP Stack (nvim-dap + dap-ui + virtual-text + adapters)** — dap_init, plugin_dapui, plugin_dap_virtual_text, dap_dap_ui, dap_remap [INFERRED 0.90]

## Communities

### Community 0 - "Plugin Manager and LSP Stack"
Cohesion: 0.16
Nodes (17): colorscheme.lua Lualine + Kanagawa Setup, mason.lua LSP Installer Setup, pack.lua Plugin Manager (vim.pack), PackChanged Autocmd - TSUpdate Build Hook, Plugin: cmp-nvim-lsp, Plugin: vim-fugitive, Plugin: gitsigns.nvim, Plugin: kanagawa.nvim (+9 more)

### Community 1 - "DAP Core and UI"
Cohesion: 0.24
Nodes (12): DAP Listeners Pattern (auto-open UI), DAP UI Auto-Open Config, DAP Go Config, DAP Init (Orchestrator), DAP JavaScript Config, DAP Keymaps, Plugin: nvim-dap-go, Plugin: nvim-dap-ui (+4 more)

### Community 2 - "Harpoon + Telescope Integration"
Cohesion: 0.18
Nodes (11): harpoon.lua Harpoon Navigation Setup, harpoon_telescope() - Harpoon in Telescope Picker, Material Colorscheme Config (disabled), Harpoon2 Plugin, Plugin: harpoon (harpoon2 branch), Plugin: telescope.nvim, Plugin: telescope-dap.nvim, telescope-live-grep-args extension (+3 more)

### Community 3 - "Core Initialization"
Cohesion: 0.22
Nodes (10): init.lua Entry Point, mini.lua Mini.nvim Utilities Setup, Plugin: mini.nvim, Plugin: oil.nvim, Plugin: taboo.vim, quick_esc.lua Fast Escape Autocmd, remap.lua Global Keymaps, set.lua Vim Options (+2 more)

### Community 4 - "Rust/Zig DAP Adapters"
Cohesion: 0.32
Nodes (8): Shared codelldb Adapter (Rust+Zig), DAP Rust Config, codelldb Adapter (Rust), runBuild (Rust build helper), DAP Zig Config, codelldb Adapter (Zig), run_build (Zig build helper), codelldb (Mason-installed DAP adapter)

### Community 5 - "Docs and Rationale"
Cohesion: 0.29
Nodes (8): CLAUDE.md Project Instructions, Treesitter Fork Rationale (original archived April 2026), vim.pack Built-in Plugin Manager (Neovim 0.12), pwa-node Adapter (JS), js-debug-adapter (Mason), neovim-treesitter/nvim-treesitter (fork), nvim-lua-config README, Treesitter Plugin Config

### Community 6 - "LSP Configuration"
Cohesion: 0.29
Nodes (7): lsp/htmx.lua HTMX and HTML LSP Config, lsp/init.lua LSP Module Loader, nvim-cmp Setup - Autocompletion Mappings, lsp/setup.lua LSP Keymaps and CMP Setup, LspAttach Autocmd - LSP Keymaps on Attach, lua_ls Config - Neovim Lua Runtime, Plugin: nvim-lspconfig

### Community 7 - "Statusline (Lualine)"
Cohesion: 0.67
Nodes (3): colorscheme.lua Lualine Conditions Table, ins_left(), ins_right()

### Community 8 - "Plugin Declarations"
Cohesion: 0.5
Nodes (0): 

### Community 9 - "Harpoon Module"
Cohesion: 1.0
Nodes (0): 

### Community 10 - "Zig DAP Module"
Cohesion: 1.0
Nodes (0): 

### Community 11 - "Rust DAP Module"
Cohesion: 1.0
Nodes (0): 

### Community 12 - "Entry Point"
Cohesion: 1.0
Nodes (0): 

### Community 13 - "Sudokid Init"
Cohesion: 1.0
Nodes (0): 

### Community 14 - "Vim Options"
Cohesion: 1.0
Nodes (0): 

### Community 15 - "User Functions"
Cohesion: 1.0
Nodes (0): 

### Community 16 - "Global Keymaps"
Cohesion: 1.0
Nodes (0): 

### Community 17 - "Mini.nvim Module"
Cohesion: 1.0
Nodes (0): 

### Community 18 - "Quick Escape"
Cohesion: 1.0
Nodes (0): 

### Community 19 - "Mason Module"
Cohesion: 1.0
Nodes (0): 

### Community 20 - "LSP Init"
Cohesion: 1.0
Nodes (0): 

### Community 21 - "HTMX LSP"
Cohesion: 1.0
Nodes (0): 

### Community 22 - "LSP Setup"
Cohesion: 1.0
Nodes (0): 

### Community 23 - "DAP Init"
Cohesion: 1.0
Nodes (0): 

### Community 24 - "JS DAP Module"
Cohesion: 1.0
Nodes (0): 

### Community 25 - "Go DAP Module"
Cohesion: 1.0
Nodes (0): 

### Community 26 - "DAP UI Module"
Cohesion: 1.0
Nodes (0): 

### Community 27 - "DAP Keymaps"
Cohesion: 1.0
Nodes (0): 

### Community 28 - "Material Theme (disabled)"
Cohesion: 1.0
Nodes (0): 

### Community 29 - "Treesitter Config"
Cohesion: 1.0
Nodes (0): 

### Community 30 - "Undotree Config"
Cohesion: 1.0
Nodes (0): 

### Community 31 - "Undotree Plugin"
Cohesion: 1.0
Nodes (1): Undotree Plugin Config

## Ambiguous Edges - Review These
- `Plugin: telescope.nvim` → `Material Colorscheme Config (disabled)`  [AMBIGUOUS]
  after/plugin/material.lua · relation: conceptually_related_to

## Knowledge Gaps
- **17 isolated node(s):** `init.lua Entry Point`, `quick_esc.lua Fast Escape Autocmd`, `user_defined_fn.lua Cppath Command`, `Plugin: undotree`, `Plugin: vim-commentary` (+12 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Harpoon Module`** (2 nodes): `harpoon_telescope()`, `harpoon.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Zig DAP Module`** (2 nodes): `zig.lua`, `run_build()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Rust DAP Module`** (2 nodes): `runBuild()`, `rust.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Entry Point`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Sudokid Init`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Vim Options`** (1 nodes): `set.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `User Functions`** (1 nodes): `user_defined_fn.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Global Keymaps`** (1 nodes): `remap.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Mini.nvim Module`** (1 nodes): `mini.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Quick Escape`** (1 nodes): `quick_esc.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Mason Module`** (1 nodes): `mason.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `LSP Init`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `HTMX LSP`** (1 nodes): `htmx.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `LSP Setup`** (1 nodes): `setup.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `DAP Init`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `JS DAP Module`** (1 nodes): `javascript.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Go DAP Module`** (1 nodes): `go.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `DAP UI Module`** (1 nodes): `dap_ui.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `DAP Keymaps`** (1 nodes): `remap.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Material Theme (disabled)`** (1 nodes): `material.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Treesitter Config`** (1 nodes): `treesitter.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Undotree Config`** (1 nodes): `undotree.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Undotree Plugin`** (1 nodes): `Undotree Plugin Config`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Plugin: telescope.nvim` and `Material Colorscheme Config (disabled)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `pack.lua Plugin Manager (vim.pack)` connect `Plugin Manager and LSP Stack` to `DAP Core and UI`, `Harpoon + Telescope Integration`, `Core Initialization`, `LSP Configuration`?**
  _High betweenness centrality (0.338) - this node is a cross-community bridge._
- **Why does `DAP Init (Orchestrator)` connect `DAP Core and UI` to `Rust/Zig DAP Adapters`?**
  _High betweenness centrality (0.091) - this node is a cross-community bridge._
- **Why does `Plugin: nvim-dap-go` connect `DAP Core and UI` to `Plugin Manager and LSP Stack`, `Docs and Rationale`?**
  _High betweenness centrality (0.087) - this node is a cross-community bridge._
- **Are the 5 inferred relationships involving `Plugin: nvim-dap` (e.g. with `Plugin: telescope-dap.nvim` and `Plugin: nvim-dap-go`) actually correct?**
  _`Plugin: nvim-dap` has 5 INFERRED edges - model-reasoned connections that need verification._
- **What connects `init.lua Entry Point`, `quick_esc.lua Fast Escape Autocmd`, `user_defined_fn.lua Cppath Command` to the rest of the system?**
  _17 weakly-connected nodes found - possible documentation gaps or missing edges._