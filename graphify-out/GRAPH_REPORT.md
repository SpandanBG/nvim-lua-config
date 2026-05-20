# Graph Report - /Users/spandanb/.config/nvim  (2026-05-21)

## Corpus Check
- 30 files · ~16,959 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 55 nodes · 37 edges · 26 communities detected
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 4 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Community 13|Community 13]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Community 17|Community 17]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]

## God Nodes (most connected - your core abstractions)
1. `DAP Init (Orchestrator)` - 6 edges
2. `DAP Zig Config` - 4 edges
3. `DAP Rust Config` - 4 edges
4. `nvim-dap-ui plugin` - 3 edges
5. `codelldb Adapter (Zig)` - 3 edges
6. `codelldb Adapter (Rust)` - 3 edges
7. `DAP UI Auto-Open Config` - 3 edges
8. `nvim-lua-config README` - 3 edges
9. `codelldb (Mason-installed DAP adapter)` - 2 edges
10. `Shared codelldb Adapter (Rust+Zig)` - 2 edges

## Surprising Connections (you probably didn't know these)
- `nvim-lua-config README` --references--> `Treesitter Fork Rationale (original archived April 2026)`  [EXTRACTED]
  README.md → after/plugin/treesitter.lua
- `nvim-lua-config README` --conceptually_related_to--> `CLAUDE.md Project Instructions`  [INFERRED]
  README.md → CLAUDE.md
- `nvim-lua-config README` --references--> `vim.pack Built-in Plugin Manager (Neovim 0.12)`  [EXTRACTED]
  README.md → CLAUDE.md
- `DAP Init (Orchestrator)` --calls--> `DAP Rust Config`  [EXTRACTED]
  lua/sudokid/dap/init.lua → lua/sudokid/dap/rust.lua
- `DAP Init (Orchestrator)` --calls--> `DAP Zig Config`  [EXTRACTED]
  lua/sudokid/dap/init.lua → lua/sudokid/dap/zig.lua

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

### Community 0 - "Community 0"
Cohesion: 0.32
Nodes (8): Shared codelldb Adapter (Rust+Zig), DAP Rust Config, codelldb Adapter (Rust), runBuild (Rust build helper), DAP Zig Config, codelldb Adapter (Zig), run_build (Zig build helper), codelldb (Mason-installed DAP adapter)

### Community 1 - "Community 1"
Cohesion: 0.47
Nodes (6): DAP Listeners Pattern (auto-open UI), DAP UI Auto-Open Config, DAP Go Config, DAP Init (Orchestrator), DAP Keymaps, nvim-dap-ui plugin

### Community 2 - "Community 2"
Cohesion: 0.5
Nodes (0): 

### Community 3 - "Community 3"
Cohesion: 0.67
Nodes (2): refresh(), schedule()

### Community 4 - "Community 4"
Cohesion: 0.67
Nodes (4): CLAUDE.md Project Instructions, Treesitter Fork Rationale (original archived April 2026), vim.pack Built-in Plugin Manager (Neovim 0.12), nvim-lua-config README

### Community 5 - "Community 5"
Cohesion: 0.67
Nodes (0): 

### Community 6 - "Community 6"
Cohesion: 1.0
Nodes (0): 

### Community 7 - "Community 7"
Cohesion: 1.0
Nodes (2): harpoon.lua Harpoon Navigation Setup, harpoon_telescope() - Harpoon in Telescope Picker

### Community 8 - "Community 8"
Cohesion: 1.0
Nodes (2): lsp/htmx.lua HTMX and HTML LSP Config, lsp/init.lua LSP Module Loader

### Community 9 - "Community 9"
Cohesion: 1.0
Nodes (0): 

### Community 10 - "Community 10"
Cohesion: 1.0
Nodes (0): 

### Community 11 - "Community 11"
Cohesion: 1.0
Nodes (0): 

### Community 12 - "Community 12"
Cohesion: 1.0
Nodes (1): init.lua Entry Point

### Community 13 - "Community 13"
Cohesion: 1.0
Nodes (0): 

### Community 14 - "Community 14"
Cohesion: 1.0
Nodes (0): 

### Community 15 - "Community 15"
Cohesion: 1.0
Nodes (1): user_defined_fn.lua Cppath Command

### Community 16 - "Community 16"
Cohesion: 1.0
Nodes (0): 

### Community 17 - "Community 17"
Cohesion: 1.0
Nodes (1): mini.lua Mini.nvim Utilities Setup

### Community 18 - "Community 18"
Cohesion: 1.0
Nodes (1): quick_esc.lua Fast Escape Autocmd

### Community 19 - "Community 19"
Cohesion: 1.0
Nodes (1): mason.lua LSP Installer Setup

### Community 20 - "Community 20"
Cohesion: 1.0
Nodes (0): 

### Community 21 - "Community 21"
Cohesion: 1.0
Nodes (1): Material Colorscheme Config (disabled)

### Community 22 - "Community 22"
Cohesion: 1.0
Nodes (0): 

### Community 23 - "Community 23"
Cohesion: 1.0
Nodes (0): 

### Community 24 - "Community 24"
Cohesion: 1.0
Nodes (0): 

### Community 25 - "Community 25"
Cohesion: 1.0
Nodes (1): Undotree Plugin Config

## Knowledge Gaps
- **16 isolated node(s):** `init.lua Entry Point`, `user_defined_fn.lua Cppath Command`, `mini.lua Mini.nvim Utilities Setup`, `quick_esc.lua Fast Escape Autocmd`, `harpoon.lua Harpoon Navigation Setup` (+11 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 6`** (2 nodes): `map()`, `git.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 7`** (2 nodes): `harpoon.lua Harpoon Navigation Setup`, `harpoon_telescope() - Harpoon in Telescope Picker`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 8`** (2 nodes): `lsp/htmx.lua HTMX and HTML LSP Config`, `lsp/init.lua LSP Module Loader`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 9`** (2 nodes): `js_debug_adapter()`, `javascript.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 10`** (2 nodes): `add_to_harpoon()`, `telescope.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 11`** (2 nodes): `set_fold_hl()`, `ufo.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 12`** (1 nodes): `init.lua Entry Point`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 13`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 14`** (1 nodes): `set.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 15`** (1 nodes): `user_defined_fn.lua Cppath Command`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 16`** (1 nodes): `remap.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 17`** (1 nodes): `mini.lua Mini.nvim Utilities Setup`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 18`** (1 nodes): `quick_esc.lua Fast Escape Autocmd`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 19`** (1 nodes): `mason.lua LSP Installer Setup`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 20`** (1 nodes): `setup.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 21`** (1 nodes): `Material Colorscheme Config (disabled)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 22`** (1 nodes): `persistence.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 23`** (1 nodes): `conform.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 24`** (1 nodes): `treesitter.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 25`** (1 nodes): `Undotree Plugin Config`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `DAP Init (Orchestrator)` connect `Community 1` to `Community 0`?**
  _High betweenness centrality (0.033) - this node is a cross-community bridge._
- **Why does `DAP Zig Config` connect `Community 0` to `Community 1`?**
  _High betweenness centrality (0.018) - this node is a cross-community bridge._
- **Why does `DAP Rust Config` connect `Community 0` to `Community 1`?**
  _High betweenness centrality (0.018) - this node is a cross-community bridge._
- **What connects `init.lua Entry Point`, `user_defined_fn.lua Cppath Command`, `mini.lua Mini.nvim Utilities Setup` to the rest of the system?**
  _16 weakly-connected nodes found - possible documentation gaps or missing edges._