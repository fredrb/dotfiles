set nocompatible
filetype off

" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'andymass/vim-matchup'
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fireplace'
Plug 'wakatime/vim-wakatime'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Language Specific plugins
Plug 'rust-lang/rust.vim'
"Plug 'rust-lang/rls'

call plug#end()

" =============================================================================
" # PLUGIN CONFIGURATION
" =============================================================================

" Sneak
"  remap f/F to sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#s_next = 1

" Lightline
set laststatus=2

" Flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
"  set highlight delay timer to 300ms
let g:operator#flashy#flash_time=300

"NERDTree
nnoremap <C-f>n :NERDTreeToggle<CR>
nnoremap <C-f>f :NERDTreeFind<CR>

"FZF
map <C-P> :Files<CR>
"map <C-P>g :GFiles<CR>
"map <C-P>b :Buffers<CR>
"map <C-P>a :Ag<CR>
"map <C-P>l :Lines<CR>
map <C-A>a :Ag<CR>
map <C-A>l :Lines<CR>
map <C-A>k :Buffers<CR>

" Visual Multi
" let g:VM_maps = {}
"let g:VM_maps = {}
"let g:VM_maps['Find Under']         = '<A-D>'           " replace C-n
"let g:VM_maps['Find Subword Under'] = '<A-D>'           " replace visual C-n

" Deoplete
let g:deoplete#enable_at_startup = 1

" Language Server config
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['~/.local/bin/pyls'],
    \ }

nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-references)
nmap <silent> gf <Plug>(lcn-format)
nmap <silent> <F2> <Plug>(lcn-rename)

" Seconds until language server updates after file changed 
"let g:LanguageClient_changeThrottle = 1


" =============================================================================
" # GENERAL SETTINGS
" =============================================================================
filetype plugin indent on
set autoindent
set number
set timeoutlen=300
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Permanent undo
" set undodir=~/.vimdid
" set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" =============================================================================
" # THEME AND COLORS
" =============================================================================
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
syntax on
hi Normal ctermbg=NONE
" Brighter comments
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

" Functions
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
