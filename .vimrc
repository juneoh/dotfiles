set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" VIM-One color scheme
Plugin 'https://github.com/rakr/vim-one.git'
" Auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim'
" Check syntax on save
Plugin 'scrooloose/syntastic'
" PEP8 style check
Plugin 'nvie/vim-flake8'
" Airline tabs
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Buffer line
Plugin 'bling/vim-bufferline'
" Git Gutter
Plugin 'airblade/vim-gitgutter'
" VIM Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Track git branch
Plugin 'tpope/vim-fugitive'
" Find file
Plugin 'ctrlpvim/ctrlp.vim'
" File tree
Plugin 'scrooloose/nerdtree'
" ES6 highlighting support
Plugin 'https://github.com/pangloss/vim-javascript.git'
" Promptline
Plugin 'edkolev/promptline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Full stack indentation
au BufNewFile,BufRead *.js,*.html,*.css,*.md,*.scss,*.R
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent

" UTF-8
set encoding=utf-8

" Enable Airline theme
let g:airline_theme='onedark'

" Enable color scheme with true color support
"if (has("nvim"))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
if (has("termguicolors"))
  set termguicolors
endif
colorscheme onedark

" Tmux support
"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

" Make the code pretty
let python_highlight_all=1
syntax on

" Make VIM respond faster
set updatetime=250

" Make line numbers always visible
set number

" Enable airlne by default.
set laststatus=2

" Enable background transparency.
"hi Normal ctermbg=none

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1

" Disable IMI upon leaving insert mode.
set imi=1

" Ignore for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|log$\|tmp$\|__pycache__$',
  \ 'file': '\v\.(pyc|so|log)$'
\ }

" Map \nt to nerdtree on
map <Leader>s <ESC>:NERDTreeToggle<CR>

" Let NERDTree show hidden files
let NERDTreeShowHidden=1

" Enable Powerline fonts
let g:airline_powerline_fonts = 1

" Map buffer keys
map 1 :buffer1<CR>
map 2 :buffer2<CR>
map 3 :buffer3<CR>
map 4 :buffer4<CR>
map 5 :buffer5<CR>
map 6 :buffer6<CR>
map 7 :buffer7<CR>
map 8 :buffer8<CR>
map 9 :buffer9<CR>

" Disable whitespace error section
let g:airline#extensions#whitespace#enabled = 0

" Enable buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
