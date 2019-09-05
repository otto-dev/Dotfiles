" ===============
" *** Plugins ***

" Configure plugin manager VimPlug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ciaranm/detectindent'
Plug 'vim-scripts/clipbrd'
Plug 'vim-scripts/genutils'
Plug 'Quramy/tsuquyomi'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-abolish'
Plug 'mattn/emmet-vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-eunuch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'alvan/vim-closetag'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'terryma/vim-expand-region'
Plug 'marijnh/tern_for_vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'wellle/targets.vim'
Plug 'mileszs/ack.vim'

" Initialize plugin manager
call plug#end()

" *** Main Configuration ***
" ================

" *** Terminal ***
" ================
let g:session_id = "vim-" . strftime('%s')
tmap <silent> <C-@> <C-W>:call term_sendkeys(bufnr('%'), "\<C-a>\<C-d>")\|bwipeout! terminal!<CR>
nmap <silent> <C-@> :if bufnr("terminal!") == -1\|call term_start('screen -D -R -S ' . g:session_id, {'term_name': 'terminal!'}) \| call setbufvar(bufnr('terminal!'), '&buflisted', 0)\|execute "resize " . (winheight(1) + winheight(0)) * 2 / 5 \|endif<CR>
autocmd VimEnter * silent call system("screen -d -m -S " . g:session_id .";screen -S ". g:session_id ." -X \"cd " . getcwd() . "\"")
autocmd VimLeave * silent call system("screen -S " . g:session_id ." -X quit")

" *** Alt-Key Mappings ***
" ================
for i in range(97,122)
    let char = nr2char(i)
    let upperChar = toupper(char)
    execute "set <M-".char.">=\e".char
    execute "set <M-S-".char.">=\e".upperChar
endfor
execute "set <M-,>=\e,"
execute "set <M-;>=\e;"

" *** Common *** "
" ================ "
source ~/Dotfiles/vim-common.vim

" *** Mappings *** "
" ================ "

" set tab settings
function! ChangeTabs(width, doExpand)
    if (a:doExpand) | let l:expand = "expandtab" | else | let l:expand = "noexpandtab" | endif
    execute ":set noexpandtab\|retab!\|set tabstop=" . a:width . " softtabstop=". a:width ." shiftwidth=". a:width ." ". l:expand ."\|retab!<CR>"
endfunction

" Buffer switching
nmap <M-s> :bprevious<CR>
nmap <M-t> :bnext <CR>

" New buffer
map <M-S-n> :enew<CR>

" File
nmap <silent> <M-w> :call CloseBufferOrQuit()<CR>
nmap <silent> <expr> <M-S-w> &mod ? ":u1\|u\<CR>:call CloseBufferOrQuit()\<CR>" : ":call CloseBufferOrQuit()\<CR>"

nmap <Space><Tab>2 :call ChangeTabs(2, 0)<CR>
nmap <Space><Tab>4 :call ChangeTabs(4, 0)<CR>
nmap <Space><Tab>8 :call ChangeTabs(8, 0)<CR>
nmap <Space><Space>2 :call ChangeTabs(2, 1)<CR>
nmap <Space><Space>4 :call ChangeTabs(4, 1)<CR>
nmap <Space><Space>8 :call ChangeTabs(8, 1)<CR>

" *** Configuration *** "
" ===================== "

" Allow buffer switching with unsaved changes
set hidden

" Fuzzy file finding
set path+=**

" GVIM
if has('gui_running')
    set guioptions -=T
    set guioptions -=m
endif

" Adding empty lines in normal mode
nnoremap <Space>o mzo<Esc>`z
nnoremap <Space>O mzO<Esc>`z

" Easy access to system clipboard
imap <M-p> <C-R>+
cmap <M-p> <C-R>+
map <M-p> "+p
map <M-S-p> "+P
map <M-c> "+y

" Paste unnamed register in insert mode
imap <C-v> <C-R>"

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
