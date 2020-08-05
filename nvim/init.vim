" *** Plugins ***

" Configure plugin manager VimPlug
call plug#begin('~/.config/nvim/plugged')

Plug 'matze/vim-move'
source ~/Dotfiles/vim/plugin/move-config.vim

Plug 'justinmk/vim-sneak'
source ~/Dotfiles/vim/plugin/sneak-config.vim

Plug 'alvan/vim-closetag'
source ~/Dotfiles/vim/plugin/closetag-config.vim

Plug 'terryma/vim-expand-region'
source ~/Dotfiles/vim/plugin/expand-region-config.vim

Plug 'Raimondi/delimitMate'
source ~/Dotfiles/vim/plugin/delimitmate-config.vim

Plug 'tpope/vim-abolish'
source ~/Dotfiles/vim/plugin/abolish-config.vim

Plug 'psf/black'
source ~/Dotfiles/vim/plugin/black-config.vim

Plug 'ciaranm/detectindent'
source ~/Dotfiles/vim/plugin/detectindent-config.vim

Plug 'romainl/vim-cool'
Plug 'sheerun/vim-polyglot'
Plug 'jason0x43/vim-js-indent' 
Plug 'editorconfig/editorconfig-vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'posva/vim-vue'

call plug#end()

source ~/Dotfiles/vim-common.vim

" tab switching
nmap <M-s> :tabprevious<CR>
nmap <M-t> :tabnext<CR>

" close tab
nmap <silent> <M-w> :bdelete<CR>
nmap <M-W> :bdelete!<CR>

" New file
map <M-N> :tabnew<CR>

" Easy access to system clipboard
imap <M-p> <C-R>+
cmap <M-p> <C-R>+
map <M-p> "+p
map <M-P> "+P
map <M-c> "+y

" disable friggn visual mode popup
nmap Q <Nop>

" open a terminal tab
nnoremap <C-enter> :tabnew +terminal<CR>

if has('nvim')
  autocmd TermOpen term://* startinsert
endif

nmap <M-L> :Black<CR>
