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

" Buffer switching
nmap <M-s> :bprevious<CR>
nmap <M-t> :bnext <CR>

" New buffer
map <M-S-n> :enew<CR>

" Adding empty lines in normal mode
nnoremap <Space>o mzo<Esc>`z
nnoremap <Space>O mzO<Esc>`z

" Indentation. h/l == h/i on colemak layout
xnoremap <M-i> >gv
xnoremap <M-h> <gv
nnoremap <M-i> >>
nnoremap <M-h> <<
imap <M-i> <C-O><M-i>
imap <M-h> <C-O><M-h>

" Easy access to system clipboard 
imap <M-p> <C-R>+
cmap <M-p> <C-R>+
map <M-p> "+p
map <M-S-p> "+P
map <M-c> "+y

" Paste unnamed register in insert mode
imap <C-v> <C-R>"

" Add punctuation to end of line
nmap <M-,> mqA,<Esc>`q
nmap <M-;> mqA;<Esc>`q
inoremap <M-,> <Esc>mqA,<Esc>`q
inoremap <M-;> <Esc>mqA;<Esc>`q

" select last pasted / changed text
nnoremap <Space>v `[v`]

" disable friggn visual mode popup
nmap Q <Nop>

" *** Configuration *** "
" ===================== "

" Misc
set wildmenu
set wildmode=longest:full,full
let mapleader = ","
set nocompatible
filetype plugin on


" Appearance
syntax enable
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Medium\ 13
colorscheme gruvbox
set background=dark
set t_Co=256
set encoding=utf8

" Keep cursor at visual distance to top and bottom
set scrolloff=5

" Search
set ignorecase
set gdefault " use the `g` flag by default.
set incsearch

" Garbage files
set nobackup
set nowritebackup
set noswapfile

" Auto reload changed files
set autoread

" create split windows in lower pane by default
set splitbelow

" Don't wait on <ESC> presses
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=800 ttimeoutlen=0
    au InsertLeave,VimEnter * set timeoutlen=800 ttimeoutlen=0
augroup END

" display absolute numbers!
set number

" Default indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Process <Tab> as key press instead of writing ^I
set wildcharm=<Tab>

" Filetype based indentation settings
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2 et
autocmd FileType vue setlocal ts=2 sts=2 sw=2 et

" Always show sign column 
set signcolumn=yes

" Load per-project directory .vimrc
set exrc
set secure

" Do not show auto-documentation in python
set completeopt=menu

" Spell check
set spell
set spelllang=en
