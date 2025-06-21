-- Core Key Mappings
local map = vim.keymap.set

-- File operations
map({'n', 'i'}, '<C-S>', '<Cmd>w!<CR>', { desc = "Save file" })

-- Add punctuation to end of line
map('n', '<M-,>', 'myA,<Esc>`y', { desc = "Add comma to end of line", silent = true })
map('i', '<M-,>', '<Esc>myA,<Esc>`ya', { desc = "Add comma to end of line", silent = true })
map('n', '<M-.>', 'myA;<Esc>`y', { desc = "Add semicolon to end of line", silent = true })
map('i', '<M-.>', '<Esc>myA;<Esc>`ya', { desc = "Add semicolon to end of line", silent = true })

-- Indentation (h/l == h/i on colemak layout)
map('x', '<M-i>', '>gv', { desc = "Indent selection" })
map('x', '<M-h>', '<gv', { desc = "Unindent selection" })
map('n', '<M-i>', '>>', { desc = "Indent line" })
map('n', '<M-h>', '<<', { desc = "Unindent line" })
map('i', '<M-i>', '<C-O><M-i>', { desc = "Indent line" })
map('i', '<M-h>', '<C-O><M-h>', { desc = "Unindent line" })

-- Select last pasted/changed text
map('n', '<Space>v', '`[v`]', { desc = "Select last change" })

-- Buffer switching
map('n', '<M-s>', '<Cmd>bprevious<CR>', { desc = "Previous buffer" })
map('n', '<M-t>', '<Cmd>bnext<CR>', { desc = "Next buffer" })

-- New buffer
map('n', '<C-n>', '<Cmd>enew<CR>', { desc = "New buffer" })

-- Close buffer
map('n', '<M-w>', '<Cmd>lua require("core.functions").close_buffer_or_quit()<CR>', { desc = "Close buffer or quit", silent = true })
map('n', '<Space><Space>w', '<Cmd>bd!<CR>', { desc = "Force close buffer", silent = true })

-- System clipboard integration
map('i', '<M-p>', '<C-R>+', { desc = "Paste from clipboard" })
map('c', '<M-p>', '<C-R>+', { desc = "Paste from clipboard" })
map({'n', 'v'}, '<M-p>', '"+p', { desc = "Paste from clipboard" })
map({'n', 'v'}, '<M-S-p>', '"+P', { desc = "Paste from clipboard before" })
map({'n', 'v'}, '<M-c>', '"+y', { desc = "Copy to clipboard" })