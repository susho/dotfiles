call plug#begin()
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0ng/vim-hybrid'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

let g:mapleader = ","

map <leader>o :NERDTreeToggle<cr>

set autowrite
set completeopt=menuone
set laststatus=2

set background=dark
colorscheme hybrid

set number

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constrains = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'deadcode', 'varcheck', 'structcheck', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'deadcode']
let g:go_metalinter_deadline = "5s"

let g:neocomplete#enable_at_startup = 1
