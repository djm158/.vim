"required for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/csapprox'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'prettier/vim-prettier'
call vundle#end()

"custom keymappings
"easier escape
inoremap jk <ESC>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
"easier window switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

filetype plugin indent on

syntax on

"necessary for 256 colorscheme
set t_Co=256           

"colorscheme
set background=dark
colorscheme gruvbox
"colorscheme railscasts

"set line numbers visible
set number

"tab sizing set tabstop=4
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
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 stdlib=libc++'
let g:syntastic_disabled_filetypes=['sh', 'bash', 'shell']
let g:syntastic_quiet_messages = { 'regex': 'SC2086\|SC2140\|SC2087' }
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_loc_list_height = 3
let g:NERDSpaceDelims = 1 "add space before comments

"autocompletion features
set completeopt=longest,menuone

"set html spaces to 2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
