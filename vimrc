" ===============
" *** Plugins ***

" TODO:
" - good indentation detection
" - install, configure and internalise tpope/vim-eunuch for file operations?
" - Chiel92/vim-autoformat for automatic formatting on save

" Configure plugin manager VimPlug
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat'
" add braces
Plug 'tpope/vim-surround'
" jump to two characters, enhanced f/t
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" comment out things
Plug 'tpope/vim-commentary'
" move lines up and down
Plug 'matze/vim-move'
Plug 'scrooloose/nerdtree'
" auto-close parentheses
Plug 'Raimondi/delimitMate'
" auto-close HTML tags
Plug 'alvan/vim-closetag'
" required for kana/*
Plug 'kana/vim-textobj-user'
" select entire file with target 'e'
Plug 'kana/vim-textobj-entire'
" select at indentation level
Plug 'kana/vim-textobj-indent'
" additional text targets, such as 'da,'
Plug 'wellle/targets.vim'
" intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Scala intellisense
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}


" Initialize plugin system
call plug#end()

" *** Fix: Alt-Key Mappings ***
" ================
if !has('nvim')
  for i in range(97,122)
      let char = nr2char(i)
      let upperChar = toupper(char)
      execute "set <M-".char.">=\e".char
      execute "set <M-S-".char.">=\e".upperChar
  endfor
  execute "set <M-,>=\e,"
  execute "set <M-;>=\e;"
endif

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

" Allow buffer switching with unsaved changes
set hidden

" CursorHold idle trigger time
set updatetime=500

" File
nmap <C-S> :w!<CR>
imap <C-S> <Esc><C-S>

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

" select last pasted / changed text
nnoremap <Space>v `[v`]

" Misc
set wildmenu
set wildmode=longest:full,full
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

" Don't wait on <ESC> presses
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=800 ttimeoutlen=0
    au InsertLeave,VimEnter * set timeoutlen=800 ttimeoutlen=0
augroup END

" Buffer switching
nmap <M-s> :bprevious<CR>
nmap <M-t> :bnext <CR>

" New buffer
map <C-n> :enew<CR>

" File
nmap <silent> <M-w> :call CloseBufferOrQuit()<CR>
nmap <silent> <Space><Space>w :bd!<CR>


" display absolute numbers!
set number

" Process <Tab> as key press instead of writing ^I
set wildcharm=<Tab>

" Enable mouse clicks
set mouse=a

" Easy access to system clipboard
imap <M-p> <C-R>+
cmap <M-p> <C-R>+
map <M-p> "+p
map <M-S-p> "+P
map <M-c> "+y

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GVIM
if has('gui_running')
    set guioptions -=T
    set guioptions -=m
endif
