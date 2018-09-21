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
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'rstacruz/vim-closer'
Plug 'prettier/vim-prettier'
Plug 'davidyorr/vim-es6-unused-imports'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }               "FZF, the GOAT fuzzy searcher
Plug 'junegunn/fzf.vim'                                                         "FZF, the GOAT fuzzy searcher
Plug 'airblade/vim-gitgutter'

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

" case insensitive search
set ignorecase

"necessary for 256 colorscheme
set t_Co=256           

" recommended that this goes before `colorscheme gruvbox`
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings = 1

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

"autocompletion features
" set completeopt=longest,menuone

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
hi tsxAttrib guifg=#F8BD7F gui=italic

" bug in vim 1453 -- need to wait for ubuntu to update
" https://github.com/w0rp/ale/issues/1334
let g:ale_echo_cursor = 0

set autochdir

" ctags
set tags=./tags,tags;$HOME

" map f3 to paste toggle
set pastetoggle=<F3>

" unused imports
autocmd BufWinEnter *.js,*.jsx,*.ts,*.tsx execute "ES6ImportsHighlight"

let g:es6_imports_gui_fg_color = 'black'
let g:es6_imports_gui_bg_color = 'red'

" comment this out if not at work
" TODO: find a more robust solution for this
let g:prettier#exec_cmd_path = "/usr/bin/prettier"

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'cli-override'

" FZF all the CONTENTS of the files in the git repo
nmap ; :GitGrep<CR>
nnoremap <Leader>g :GitGrep<Cr>
command! -bang -nargs=* GitGrep
  \ call fzf#vim#ag(<q-args>,
  \  fzf#vim#with_preview({
  \    'options': '--no-hscroll --delimiter : --nth 4..',
  \    'dir': systemlist('git rev-parse --show-toplevel')[0]},
  \    'right:60%'
  \  ),
  \  <bang>0)

" FZF all the CONTENTS fo the files in the current dir
nnoremap <Leader>a :Ag<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
  \                 <bang>0)


" gui stuff
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
