"required for Vundle
set nocompatible
filetype off
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'
Plug 'jalvesaq/Nvim-R'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'rstacruz/vim-closer'
Plug 'prettier/vim-prettier'
" Plug 'lucasecdb/vim-tsx'

call plug#end()

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

" recommended that this goes before `colorscheme gruvbox`
let g:gruvbox_italic=1

"colorscheme
set background=dark
colorscheme gruvbox
"colorscheme railscasts

"set line numbers visible
set number

"tab sizing set tabstop=4
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
set smartindent

"nnoremap <space> za

let g:NERDSpaceDelims = 1 "add space before comments
" Add spaces after comment delimiters by default

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" R config
let R_assign = 0

"autocompletion features
set completeopt=longest,menuone

"set html spaces to 2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType r setlocal ts=2 sts=2 sw=2

set term=screen-256color

"tsx -> ts
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

"enable italic comments
"https://sookocheff.com/post/vim/italics/
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

highlight Comment cterm=italic

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" i don't think the color works here, but this makes tsx attributes italic
hi tsxAttrib guifg=#F8BD7F cterm=italic

" bug in vim 1453 -- need to wait for ubuntu to update
" https://github.com/w0rp/ale/issues/1334
let g:ale_echo_cursor = 0

" ctags
set tags=tags
