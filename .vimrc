"required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scroolose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()

"custom keymappings
inoremap jk <ESC>

filetype plugin indent on

syntax on

"necessary for 256 colorscheme
set t_Co=256           

"colorscheme
set background=dark
colorscheme gruvbox

"set line numbers visible
set number

"tab sizing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

"maps ctrl-p to open chromium browser, useful for quick html doc views
nnoremap <C-p> :!chromium-browser %<CR>
