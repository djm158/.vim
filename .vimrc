"required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercatin/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/seoul256.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scroolose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()

"custom keymappings
inoremap jk <ESC>

filetype plugin indent on

syntax on

"colorscheme
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
set background=dark
colorscheme gruvbox

set number

"tab sizing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
nnoremap <C-p> :!chromium-browser %<CR>
