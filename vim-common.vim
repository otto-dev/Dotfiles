" *** Configuration *** "
" ===================== "

" Search
set ignorecase
set gdefault " use the `g` flag by default.
set incsearch
" set nohlsearch

" Keep cursor at visual distance to top and bottom
set scrolloff=5

" Garbage files
set nobackup
set nowritebackup
set noswapfile

" Auto reload changed files
set autoread

" Default indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Load per-project directory .vimrc
set exrc
set secure

" don't break lines mid-word
set linebreak

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
nmap <silent> <M-,> myA,<Esc>`y
inoremap <silent> <M-,> <Esc>myA,<Esc>`y
nmap <silent> <M-.> myA;<Esc>`y
inoremap <silent> <M-.> <Esc>myA;<Esc>`y

" Indentation. h/l == h/i on colemak layout
xnoremap <M-i> >gv
xnoremap <M-h> <gv
nnoremap <M-i> >>
nnoremap <M-h> <<
imap <M-i> <C-O><M-i>
imap <M-h> <C-O><M-h>

" go to mark
nnoremap <M-m> `

" Adding empty lines in normal mode
nnoremap <Space>o mzo<Esc>`z
nnoremap <Space>O mzO<Esc>`z

" select last pasted / changed text
nnoremap <Space>v `[v`]

" jump to start/end of line in insert mode
inoremap <C-A> <Esc>I
inoremap <C-E> <Esc>A
