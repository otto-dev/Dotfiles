nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

" Case sensitivity is determined by 'ignorecase' and 'smartcase'.
let g:sneak#use_ic_scs = 1

" Pressing s/S again will jump to the next match
let g:sneak#s_next = 1

" Disable '>' prompt
let g:sneak#prompt = ''

" Disable highlight
autocmd ColorScheme * hi! link Sneak Normal
hi! link Sneak Normal

" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
