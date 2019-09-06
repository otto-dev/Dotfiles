" *** Mappings *** "
" ================ "

" Escape
inoremap · <Esc>
noremap · <Esc>
cnoremap · <C-C>

" Command mode
noremap <M-a> :

" File
nmap <C-S> :w!<CR>
imap <C-S> <Esc><C-S>

" The hjkl keys are scattered on my Colemak based keyboard layout. The following are the
" characters which I get when pressing AltGr together with the 'original' hjkl
" keys. This way I can simulate the normal hjkl key positions by pressing
" AltGr.
noremap ß h
noremap ü gj
noremap ä gk
noremap ö l
map k gk
map j gj

" Add punctuation to end of line
nmap <M-,> mqA,<Esc>`q
inoremap <M-,> <Esc>mqA,<Esc>`q
nmap <M-.> mqA;<Esc>`q
inoremap <M-.> <Esc>mqA;<Esc>`q

" Indentation. h/l == h/i on colemak layout
xnoremap <M-i> >gv
xnoremap <M-h> <gv
nnoremap <M-i> >>
nnoremap <M-h> <<
imap <M-i> <C-O><M-i>
imap <M-h> <C-O><M-h>

" Adding empty lines in normal mode
nnoremap <Space>o mzo<Esc>`z
nnoremap <Space>O mzO<Esc>`z

" select last pasted / changed text
nnoremap <Space>v `[v`]
