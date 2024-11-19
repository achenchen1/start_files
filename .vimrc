filetype off

" Plug part
call plug#begin()
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-bufferline'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mechatroner/rainbow_csv',
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on

" Code formatting
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Editor config
set number
set hlsearch
set ignorecase
set smartcase
set scrolloff=10
set backspace=indent,eol,start
set colorcolumn=120
set belloff=all
set linebreak
set clipboard=unnamed

" Color Scheme
set background=dark
colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'
vnoremap <silent> <F3> "_cgv""0P
" colorscheme gruvbox
" let g:gruvbox_contrast_dark="hard"
" let g:airline_theme='gruvbox'

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" SimplyFold
let g:SimpylFold_docstring_preview = 1
au BufRead,BufNewFile *.py setlocal foldmethod=expr foldexpr=SimpylFold#FoldExpr()

" ctrl-p
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = 'env'

" Spellcheck
autocmd FileType markdown setlocal spell

set tags=./tags;

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

" coc
" tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" csv
let g:csv_start = 1
let g:csv_end = 100


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
