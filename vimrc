
source $VIMRUNTIME/defaults.vim
set nocp
"colorscheme habamax
colorscheme default
nnoremap "," <Nop>
let mapleader = ","

if executable('clangd')
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': ['clangd'],
                \ 'allowlist': ['c', 'cpp'],
                \ })
endif

" let g:ale_enabled = 1
let g:ale_set_highlights = 0              " ancesannoy
let g:ale_virtualtext_cursor = 'disabled' " aancesnnoy
let g:ale_sign_column_always = 1          " oyancesnno
let g:ale_lint_on_text_changed = 'never'  " oyancesnno
let g:ale_lint_on_insert_leave = 0        " yancesnoya
let g:ale_lint_on_enter = 0               " yancesnnoy
let g:ale_lint_on_save = 1
"let g:ale_lint_on_filetype_changed = 1
let g:ale_linters = {
            \ 'c': ['clangtidy'],
            \ 'cpp': ['clangtidy'],
            \ 'cs': ['OmniSharp'],
            \ }
"let g:ale_fix_on_save = 1
"let b:ale_fixers = {
"            \ '*': ['remove_trailing_lines', 'trim_whitespace']
"            \ }
let g:ale_pattern_options_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_keep_list_window_open = 0
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

"let g:airline#extensions#ale#enabled = 1

let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'lineDown': ['<C-e>', 'j'],
\ 'lineUp': ['<C-y>', 'k']
\}
let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1],
\ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
\ 'borderhighlight': ['Special']
\}
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_server_use_net6 = 1
"let g:OmniSharp_prefer_global_sln = 1          " start roslyn in sln dir
"let g:OmniSharp_server_type = 'roslyn'         " start roslyn in sln dir

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" let g:netrw_preview :belowright
" let g:netrw_list_hide = netrw_gitignore#Hide()
" let g:netrw_liststyle = 3

set tabstop=8 softtabstop=0 shiftwidth=4 expandtab smarttab
set number signcolumn=yes
set hlsearch incsearch
set laststatus=2
set scrolloff=5
set encoding=utf-8
set title
set textwidth=80
set backspace=indent,eol,start

scriptencoding utf-8
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

nnoremap <buffer> gd :LspDefinition<CR>
"nnoremap <buffer> gD :tab split<CR>:LspDefinition<CR>
nnoremap <buffer> <Leader>r  :LspRename<CR>
nnoremap <buffer> <Leader>l/ :LspReferences<CR>
nnoremap <buffer> <Leader>m  :LspDocumentFormat<CR>
nnoremap <buffer> <Leader>,  :LspHover<CR>

nnoremap <Leader>- :bprevious<CR>



runtime ftplugin/man.vim
let g:ft_man_open_mode = 'tab'
let g:ft_man_folding_enable = 1
set keywordprg=:Man
set matchpairs=
set wildmenu wildmode=list:longest,full wildignorecase


if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    " Enable true colors :help xterm-true-color
    let &termguicolors = v:true
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Enable bracketed paste mode :help xterm-bracketed-paste
    let &t_BE = "\<Esc>[?2004h"
    let &t_BD = "\<Esc>[?2004l"
    let &t_PS = "\<Esc>[200~"
    let &t_PE = "\<Esc>[201~"

    " Enable focus event tracking :help xterm-focus-event
    let &t_fe = "\<Esc>[?1004h"
    let &t_fd = "\<Esc>[?1004l"
    execute "set <FocusGained>=\<Esc>[I"
    execute "set <FocusLost>=\<Esc>[O"

    " Enable modified arrow keys :help arrow_modifiers
    execute "silent! set <xUp>=\<Esc>[@;*A"
    execute "silent! set <xDown>=\<Esc>[@;*B"
    execute "silent! set <xRight>=\<Esc>[@;*C"
    execute "silent! set <xLeft>=\<Esc>[@;*D"
endif
