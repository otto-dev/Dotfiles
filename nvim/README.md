# Neovim Configuration

This is a modern Neovim configuration ported from Vim, using Lua for configuration.

## Features

- **Plugin Manager**: lazy.nvim
- **Colorscheme**: Gruvbox
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope
- **Completion**: CoC.nvim (for compatibility with Neovim 0.9.x)
- **Buffer Management**: bufferline.nvim
- **Enhanced Motions**: leap.nvim
- **Text Objects**: vim-textobj-user with extensions
- **Language Support**: Scala (coc-metals), Python (coc-pyright), Dart, HCL

## Installation

1. Ensure the symlink is set up:
   ```bash
   ln -sf ~/Dotfiles/nvim ~/.config/nvim
   ```

2. Open Neovim and plugins will be automatically installed.

## Key Mappings

### General
- `<C-S>` - Save file
- `<M-,>` - Add comma to end of line
- `<M-.>` - Add semicolon to end of line
- `<Space>v` - Select last changed text

### Buffers
- `<M-s>` - Previous buffer
- `<M-t>` - Next buffer
- `<C-n>` - New buffer
- `<M-w>` - Close buffer or quit

### Navigation
- `<Space>p` - Find files (Telescope)
- `<M-o>` - Toggle file tree
- `s/S` - Leap forward/backward

### Code Navigation (CoC)
- `<Space><Space>d` - Go to definition
- `<Space><Space>r` - Find references
- `<Space>t` - Show documentation
- `<Space>r` - Rename symbol
- `<Space>a` - Code actions

### Clipboard
- `<M-p>` - Paste from system clipboard
- `<M-c>` - Copy to system clipboard

## Notes

- This configuration requires Neovim 0.9.x or later
- For Neovim 0.10+, consider migrating from CoC to native LSP
- The C compiler warnings can be ignored unless you need Treesitter parsers