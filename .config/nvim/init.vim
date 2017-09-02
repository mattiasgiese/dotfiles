" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Easily align text
" used by puppet-vim
Plug 'godlygeek/tabular'

" ctags support/puppet-vim
Plug 'majutsushi/tagbar'

" reqs for snipmate (utility plugins)
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'garbas/vim-snipmate'

Plug 'rodjek/vim-puppet'

" tpope FTW
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'


Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.py' }

Plug 'vim-syntastic/syntastic'

" themes
Plug 'josuegaleas/jay'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" search files with ack/ag
Plug 'mileszs/ack.vim'


Plug 'vim-airline/vim-airline'

" syntax/indent/ftplugins for a many languages/tools
Plug 'sheerun/vim-polyglot'


" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" ### Looks
syntax enable
set background=dark
colorscheme jay

" Show matching brackets when text indicator is over them
set showmatch

" ### Auto Commands
autocmd BufRead,BufNewFile ~/git/layer8/ansible-stuff/*.yml/ syntax=ansible
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead Jenkinsfile  setf groovy

" ### Undo
set undolevels=100

" ### Behaviour
" I hate tabs.
set expandtab           " enter spaces when tab is pressed
set textwidth=100       " break lines when line length increases
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set softtabstop=2

set iskeyword+=_,$,@,%,#    " none of these are word dividers

" ## Filetypes
filetype plugin on
filetype indent on

 " Allow backspacing over indent, eol, and the start of an insert
set backspace=2


" ### History
" Sets how many lines of history VIM has to remember
set history=700


" ### Completion
" ## Filename completion
set wildmenu
set wildmode=longest:full,full

" With ack-vim: Use the_silver_searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"" ignore unneccessary file types in autocomplete mode
set wildignore+=*.dict,*.aux,*.nav,*.out,*.toc,*.vrb,*.snm
"
" I don't want no fucking bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


" ### Search
set incsearch
set ignorecase

" Set the search scan to wrap around the file
set wrapscan
" Turn on Highlighting of search results
set hlsearch

" ### Buffers
" ALT-n next buffer and list, ALT-p previous buffer
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
nnoremap <C-n> :bnext<CR>:redraw<CR>
nnoremap <C-p> :bprevious<CR>:redraw<CR>

" ### Motion
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
 
" ### Encoding
" Make sure utf-8 is used
set encoding=utf-8 
set termencoding=utf-8

