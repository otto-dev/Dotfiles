" Disable the automatic key maps
let g:move_map_keys = 0

" indent the buffer after every move operation?
let g:move_auto_indent = 1

" j/k == n/e on colemak layout
vmap <M-n> <Plug>MoveBlockDown
vmap <M-e> <Plug>MoveBlockUp
nmap <M-n> <Plug>MoveLineDown
nmap <M-e> <Plug>MoveLineUp
