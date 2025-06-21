-- Auto Commands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Fast escape
local FastEscape = augroup('FastEscape', { clear = true })
autocmd('InsertEnter', {
  group = FastEscape,
  callback = function()
    vim.opt.timeoutlen = 800
    vim.opt.ttimeoutlen = 0
  end,
})
autocmd({'InsertLeave', 'VimEnter'}, {
  group = FastEscape,
  callback = function()
    vim.opt.timeoutlen = 800
    vim.opt.ttimeoutlen = 0
  end,
})