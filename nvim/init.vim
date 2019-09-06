" *** Plugins ***

" Configure plugin manager VimPlug
call plug#begin('~/.config/nvim/plugged')

Plug 'matze/vim-move'
source ~/Dotfiles/vim/plugin/move-config.vim

Plug 'justinmk/vim-sneak'
source ~/Dotfiles/vim/plugin/sneak-config.vim

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

source ~/Dotfiles/vim-common.vim

" tab switching
nmap <M-s> :tabprevious<CR>
nmap <M-t> :tabnext<CR>

" close tab
nmap <M-w> :bdelete<CR>
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

