# Neovim Keybindings Reference

This document contains all the keybindings for this Neovim configuration.

## Leader Key

- Leader is set to `<Space>`

## File Management

### Neo-tree (File Explorer)

- `<C-n>` - Open/focus Neo-tree if closed or unfocused; return to code if focused
- `<leader>e` - Toggle Neo-tree visibility (open/close)

### Telescope (Fuzzy Finder)

- `<leader>gi` - Git files
- `<leader>rf` - Find files
- `<leader>ra` - Live grep
- `<leader>rs` - Grep string with input

## Git Operations

### Neogit

- `<leader>gg` - Open Neogit interface
- `c` - Commit popup
- `P` - Push popup
- `p` - Pull popup
- `r` - Rebase popup
- `m` - Merge popup
- `R` - Reset popup
- `X` - Soft reset popup
- `D` - Diff popup
- `z` - Stash popup

### Diffview

- `<leader>gd` - Open Diffview
- `<leader>gc` - Close Diffview
- `<leader>gh` - File history

## LSP (Language Server Protocol)

### General LSP

- `K` - Hover documentation
- `<leader>k` - Show diagnostics at cursor
- `<leader>gd` - Go to definition
- `<leader>gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>gf` - Format code

### Additional LSP Keybindings (in Neogit)

- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `<C-k>` - Signature help
- `gr` - References
- `<space>rn` - Rename
- `<space>f` - Format
- `<space>ca` - Code actions

## Harpoon (File Navigation)

- `<leader>a` - Add file to harpoon
- `<C-e>` - Toggle harpoon quick menu
- `<C-h>` - Navigate to file 1
- `<C-j>` - Navigate to file 2
- `<C-k>` - Navigate to file 3
- `<C-l>` - Navigate to file 4
- `<C-y>` - Navigate to file 5
- `<C-u>` - Navigate to file 6
- `<C-i>` - Navigate to file 7
- `<C-o>` - Navigate to file 8

## General Operations

- `<leader>s` - Save all files
- `<leader>re` - Explore (netrw)
- `<leader>rw` - Replace word under cursor

## Completion (nvim-cmp)

- `<C-Space>` - Trigger completion
- `<C-b>` - Scroll docs up
- `<C-f>` - Scroll docs down
- `<C-e>` - Abort completion
- `<CR>` - Confirm selection

## Auto-pairs

- Automatically pairs brackets, quotes, etc.
- `<BS>` - Delete paired character
- `<CR>` - New line with proper indentation

## Treesitter

- Syntax highlighting and indentation for supported languages
- Supported languages: lua, cmake, javascript, cpp, c, java, python, rust, make, typescript, tsx, markdown

## File Type Specific

The following file types automatically use 2-space indentation:

- html, css, typescript, javascript, typescriptreact, javascriptreact, vue

## Tips

- Use `:help` to get help on any command
- Use `:checkhealth` to check plugin health
- Use `:Lazy` to manage plugins
- Use `:TSInstall <language>` to install additional Treesitter parsers
