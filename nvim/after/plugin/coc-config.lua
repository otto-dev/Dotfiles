-- CoC configuration
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tab completion
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : v:lua.check_back_space() ? "\\<Tab>" : coc#refresh()', { expr = true, silent = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

-- Use <c-space> to trigger completion
if vim.fn.has('nvim') == 1 then
  map('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
else
  map('i', '<C-@>', 'coc#refresh()', { expr = true, silent = true })
end

-- Make <CR> auto-select the first completion item
map('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', { expr = true, silent = true })

-- GoTo code navigation
map('n', '<Space><Space>d', '<Plug>(coc-definition)', opts)
map('n', '<Space><Space>y', '<Plug>(coc-type-definition)', opts)
map('n', '<Space><Space>i', '<Plug>(coc-implementation)', opts)
map('n', '<Space><Space>r', '<Plug>(coc-references)', opts)

-- Metals specific
map('n', '<Space>ws', '<Plug>(coc-metals-expand-decoration)', opts)

-- Show documentation
function _G.show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end

map('n', '<Space>t', '<Cmd>lua _G.show_documentation()<CR>', opts)
map('i', '<C-t>', '<C-O><Cmd>lua _G.show_documentation()<CR>', opts)

-- Symbol renaming
map('n', '<Space>r', '<Plug>(coc-rename)', opts)

-- Code actions
map({'x', 'n'}, '<Space>a', '<Plug>(coc-codeaction-selected)', opts)
map('n', '<Space>a', '<Plug>(coc-codeaction-cursor)', opts)

-- Fix current line
map('n', '<Space><Space>f', '<Plug>(coc-fix-current)', opts)

-- Code lens
map('n', '<Space>cl', '<Cmd>call CocActionAsync("codeLensAction")<CR>', opts)

-- Text objects
map({'x', 'o'}, 'if', '<Plug>(coc-funcobj-i)', opts)
map({'x', 'o'}, 'af', '<Plug>(coc-funcobj-a)', opts)
map({'x', 'o'}, 'ic', '<Plug>(coc-classobj-i)', opts)
map({'x', 'o'}, 'ac', '<Plug>(coc-classobj-a)', opts)

-- Commands
vim.cmd([[
  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
]])

-- Highlight symbol under cursor
vim.cmd([[
  autocmd CursorHold * silent call CocActionAsync('highlight')
]])

-- Update statusline
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

-- Install extensions
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-pyright',
  'coc-yaml',
  'coc-git',
  'coc-eslint',
  'coc-prettier',
  'coc-metals'
}