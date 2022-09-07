filetype off

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle part
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'chrisbra/csv.vim'
Plugin 'bling/vim-bufferline'
Plugin 'qpkorr/vim-bufkill'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-fugitive'
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

" Trailing whitespace 
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Color Scheme 
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
let g:airline_theme='gruvbox'

" ctrl-p
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = 'env'

" Spellcheck
autocmd FileType markdown setlocal spell

" rainbow brackets
" let g:rainbow_active = 1

" au BufWritePost *.py,*.c,*.cpp,*.h !ctags -R
