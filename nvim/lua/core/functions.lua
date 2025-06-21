-- Utility Functions
local M = {}

function M.close_buffer_or_quit()
  local buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)')
  local empty_buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val))')
  
  if buffer_count == 1 and empty_buffer_count == 1 then
    vim.cmd('silent! quitall')
  else
    vim.cmd('silent! bdelete')
  end
end

return M