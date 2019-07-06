" ===============
" *** Plugins ***

" Configure plugin manager VimPlug
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sleuth'

call plug#end()

" *** Main Configuration ***
" ================
source ~/Dotfiles/vim-common.vim
