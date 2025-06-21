# Neovim Key Bindings Reference

## File Operations
- `<C-S>` - Save file (works in normal and insert mode)
- `<C-n>` - Create new buffer

## Text Editing
- `<M-,>` - Add comma to end of line
- `<M-.>` - Add semicolon to end of line
- `<M-i>` - Indent line/selection (h/i for Colemak layout)
- `<M-h>` - Unindent line/selection
- `<M-n>` - Move line/block down (j/n for Colemak layout)
- `<M-e>` - Move line/block up (k/e for Colemak layout)
- `<Space>v` - Select last pasted/changed text

## Buffer Navigation
- `<M-s>` - Previous buffer
- `<M-t>` - Next buffer
- `<M-w>` - Close buffer (or quit if last buffer)
- `<Space><Space>w` - Force close buffer

## File Navigation
- `<Space>p` - Fuzzy find files (Telescope)
- `<M-o>` - Toggle file tree (NvimTree)

## Motion Commands
- `s` - Leap forward (2-character search with labels)
- `S` - Leap backward (2-character search with labels)
- `f/F` - Enhanced find character forward/backward (clever-f)
- `t/T` - Enhanced till character forward/backward (clever-f)
  - Pressing f/F/t/T again jumps to next/previous match

## Code Navigation (CoC)
- `<Space><Space>d` - Go to definition
- `<Space><Space>y` - Go to type definition
- `<Space><Space>i` - Go to implementation
- `<Space><Space>r` - Find references
- `<Space>t` - Show documentation (hover)
- `<C-t>` - Show documentation (in insert mode)

## Code Actions (CoC)
- `<Space>r` - Rename symbol
- `<Space>a` - Code actions for selected/current line
- `<Space><Space>f` - Fix current line
- `<Space>cl` - Code lens action
- `<Space>ws` - Expand decoration (Scala Metals)

## Text Objects (CoC)
- `if/af` - Function inner/around
- `ic/ac` - Class inner/around

## Completion (CoC)
- `<Tab>` - Next completion item
- `<S-Tab>` - Previous completion item
- `<C-Space>` - Trigger completion
- `<CR>` - Confirm completion

## System Clipboard
- `<M-p>` - Paste from system clipboard
- `<M-S-p>` - Paste before cursor from system clipboard
- `<M-c>` - Copy to system clipboard

## Commands
- `:Format` - Format current buffer
- `:OR` - Organize imports

## Plugin Commands
- `gc` - Comment/uncomment (vim-commentary)
- `cs` - Change surrounding (vim-surround)
- `ds` - Delete surrounding (vim-surround)
- `ys` - Add surrounding (vim-surround)

## Notes
- Alt key is represented as `<M-...>` (Meta)
- All keybindings work in Neovim without special configuration
- Keybindings are optimized for Colemak keyboard layout where noted