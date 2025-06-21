-- Core Neovim Options
local opt = vim.opt

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.incsearch = true
opt.hlsearch = true

-- UI
opt.scrolloff = 5
opt.number = true
opt.pumblend = 10
opt.termguicolors = true
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildcharm = vim.fn.char2nr('\t')
opt.shortmess:append("c")
opt.inccommand = 'split'

-- Files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.autoread = true
opt.updatetime = 300
opt.fixendofline = false

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Behavior
opt.exrc = true
opt.secure = true
opt.linebreak = true
opt.hidden = true
opt.mouse = "a"
opt.timeoutlen = 800
opt.ttimeoutlen = 0

-- Appearance
opt.listchars = "tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·"
opt.guifont = "SauceCodePro Nerd Font Mono Medium:h13"
opt.background = "dark"
opt.encoding = "utf8"

-- Create undo directory if it doesn't exist
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undo", "p")