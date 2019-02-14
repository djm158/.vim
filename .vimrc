set nocompatible
filetype off
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
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
Plug 'easymotion/vim-easymotion'
Plug 'qpkorr/vim-bufkill'
Plug 'danro/rename.vim'

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
set runtimepath+=~/.vim/plugged/YouCompleteMe
syntax on

" hide open buffers
set hidden
set noshowmode
set noruler
set nostartofline
set showmatch

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

"tab sizing
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
set smartindent

au FileType python setl sw=2 sts=2 et
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
set completeopt-=preview

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
" autocmd BufWinEnter *.js,*.jsx,*.ts,*.tsx execute "ES6ImportsHighlight"

let g:es6_imports_gui_fg_color = 'black'
let g:es6_imports_gui_bg_color = 'red'

" comment this out if not at work
" TODO: find a more robust solution for this
let g:prettier#exec_cmd_path = "home/dmcgrath/bin/prettier"

" FZF all the CONTENTS of the files in the git repo
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
nnoremap <Leader>f :Ag<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
  \                 <bang>0)

" fzf open buffers
nnoremap <Leader>e :Buffers<CR>

" FZF all the files in the git repo
nnoremap <C-p> :GitFiles<CR>
command! -bang -nargs=? -complete=dir GitFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)

" FZF the files in the current folder
nnoremap <Leader>a :FZFAdjacent<CR>
command! FZFAdjacent call s:fzf_neighbouring_files()
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

" gui stuff
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

set hlsearch

"Allows Easymotion to be called with 's'
nmap s <Plug>(easymotion-s)

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

map <C-n> :bnext<CR>
map <C-m> :bprevious<CR>
map <C-c> :BD<cr>

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>

set clipboard=unnamedplus

" clear search w/ spacebar
map <Space> :noh<cr>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" deal with whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
