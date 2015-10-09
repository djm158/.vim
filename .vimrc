"required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
<<<<<<< HEAD
"Plugin 'jelera/vim-javascript-syntax'
=======
>>>>>>> addd481b936db0b0679ab30da76b13381bd5a26c
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scroolose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
<<<<<<< HEAD
"Plugin 'tpope/vim-markdown'
"Plugin 'shime/vim-livedown'
"lugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'Valloric/YouCompleteMe'
=======
>>>>>>> addd481b936db0b0679ab30da76b13381bd5a26c
Plugin 'rust-lang/rust.vim'
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
set autoindent
set smartindent

"nnoremap <space> za

"emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"autocompletion features
set completeopt=longest,menuone
