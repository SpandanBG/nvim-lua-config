# nvim-lua-config

## Pre-requisits
- Packer:
```
 git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- `sudo apt install lua5.3 fzf ripgrep fd`
- Install `Rust` with `cargo` - [download](https://www.rust-lang.org/tools/install)

- Vscode-Js-Debug:
When you run `:PackerUpdate` to install the `microsoft/vscode-js-debug`, make sure the node version is `lts/hydrogen`

## DAP
- Node DAPs
Make sure your node version setting is at `lts/hydrogen` when you run it

## LSP Problems
1. For the error: `query error: invalid node type at position`, follow solution [here](https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position)

## For Mac:
The `<M-xyz>` where `M` is `Alt` doesn't work cause the terminal needs to be configured to handle `Option` as `Alt`.
You can update the config of your terminal to do that.

Example for `Alacritty`
```toml
# alacritty.toml

[window]
option_as_alt = "Both"
```

## Undo Tree Issue:
An issue of unable to save undo file might arise if the folder `~/.vim/undodir` does not belong to the current user.

To fix this: `sudo chown -R <new_owner_username> <path_to_folder>`
