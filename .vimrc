source $VIMRUNTIME/defaults.vim

nnoremap "," <Nop>
let mapleader = ","

if executable('clangd')
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': ['clangd'],
                \ 'allowlist': ['c', 'cpp'],
                \ })
endif

let g:ale_linters = {
            \ 'c': ['clangtidy'],
            \ 'cpp': ['clangtidy'],
            \ }
let g:ale_pattern_options_enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:airline#extensions#ale#enabled = 1

call netrw_gitignore#Hide()
let g:netrw_liststyle = 3

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set scrolloff=5
set hlsearch
set incsearch
set laststatus=2
set signcolumn=yes

filetype on
filetype plugin on
filetype indent on
filetype indent plugin on
syntax enable

nnoremap <silent> <C-l> :nohlsearch<CR>
vnoremap <silent> K :m '<-2<CR>gv=gv
vnoremap <silent> J :m '>+1<CR>gv=gv

noremap <silent> <Leader>e :Explore<CR>

nnoremap <silent> <Tab><Tab> :tabnew<CR>
nnoremap <silent> <Tab>e :Texplore<CR>
nnoremap <silent> <Tab>q :q<CR>
nnoremap <silent> <Tab>. :tabonly<CR>
nnoremap <silent> <Tab>h gT
nnoremap <silent> <Tab>l gt
nnoremap <silent> <Tab>j :tabfirst<CR>
nnoremap <silent> <Tab>k :tablast<CR>
nnoremap <silent> <Tab>s :tab split<CR>
nnoremap <Tab>f :tabnew<CR>:Files<CR>
nnoremap <Tab>t :tabnew<CR>:Rg<CR>

nnoremap <Leader>/  :Lines<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ft :Rg<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fh :Helptags<CR>
nnoremap <Leader>fs :BCommits<CR>

nnoremap gd :LspDefinition<CR>
nnoremap gD :tab split<CR>:LspDefinition<CR>
nnoremap C-rr :LspRename<CR>
nnoremap <Leader>l/ :LspReferences<CR>

runtime ftplugin/man.vim
