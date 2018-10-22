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

" Onedark color scheme
Plugin 'joshdick/onedark.vim'
" Auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim'
" Autocomplete with tab
Plugin 'ervandew/supertab'
" PEP8 style check
Plugin 'nvie/vim-flake8'
" Airline tabs
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'pangloss/vim-javascript.git'
" HTML5 indentation and syntax
Plugin 'othree/html5.vim'
" SCSS syntax support
Plugin 'cakebaker/scss-syntax.vim'
" vim-tmux navigation keys
Plugin 'christoomey/vim-tmux-navigator'
" Vim-tmux integration
Plugin 'benmills/vimux'
" Python AutoComplete
Plugin 'rkulla/pydiction'
" Kill buffer without losing split
Plugin 'qpkorr/vim-bufkill'
" JSX highlighting
Plugin 'mxw/vim-jsx'
" Syntax checking
Plugin 'w0rp/ale'

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

" Default indentation for full stack development
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Markdown readability
au BufNewFile,BufRead *.md
    \ set textwidth=80

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" UTF-8
set encoding=utf-8

" Enable Airline theme
let g:airline_theme='onedark'

" Enable color scheme with true color support
"if (has("nvim"))
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
"if (has("termguicolors"))
"  set termguicolors
"endif
silent! colorscheme onedark

" Tmux support
"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

" Make the code pretty
let python_highlight_all=1
syntax on

" Make VIM respond faster
" set updatetime=250

" Enable airlne by default.
set laststatus=2

" Enable background transparency.
hi Normal ctermbg=none

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1

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

" Disable whitespace error section
let g:airline#extensions#whitespace#enabled = 0

" Enable buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamecollapse = 1
nmap 1 <Plug>AirlineSelectTab1
nmap 2 <Plug>AirlineSelectTab2
nmap 3 <Plug>AirlineSelectTab3
nmap 4 <Plug>AirlineSelectTab4
nmap 5 <Plug>AirlineSelectTab5
nmap 6 <Plug>AirlineSelectTab6
nmap 7 <Plug>AirlineSelectTab7
nmap 8 <Plug>AirlineSelectTab8
nmap 9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
