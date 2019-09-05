" *** Plugins ***

" Configure plugin manager VimPlug
call plug#begin('~/.config/nvim/plugged')

Plug 'matze/vim-move'
source ~/Dotfiles/vim/plugin/move-config.vim

Plug 'justinmk/vim-sneak'
source ~/Dotfiles/vim/plugin/sneak-config.vim

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

