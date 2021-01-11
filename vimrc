set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jalcine/cmake.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tikhomirov/vim-glsl'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'rust-lang/rls'
Plugin 'davidhalter/jedi-vim'


call vundle#end()
syntax enable
"filetype plugin indent on

"Disable errorbells
set noeb vb t_vb=

set number
set cursorline
set autoindent

"colorscheme spacegray
colorscheme zenburn

"zenburn customizing
hi Search ctermfg=230 ctermbg=16

"Airline configuration:
let g:airline_powerline_fonts=1
let g:airline_section_a = airline#section#create(['#', 'mode'])

"Default tabs (e.g. without editorconfig)
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Search configuration
set hlsearch
set incsearch

" Keybinds
map <C-n> :NERDTreeToggle<CR>

" C++ Stuff
set exrc
set secure

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" C++ Highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1



