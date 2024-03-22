filetype off

" set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle part
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-bufferline'
Plugin 'qpkorr/vim-bufkill'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/vim-tomorrow-theme'
call vundle#end()
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

" Color Scheme
set background=dark
colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'
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


" ctrl-p
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = 'env'

" Spellcheck
autocmd FileType markdown setlocal spell

" au BufWritePost *.py,*.c,*.cpp,*.h !ctags -R
" let base16colorspace=256

set tags=./tags;

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
