" Use the Solarized Dark theme

" colorscheme stereokai 
colorscheme wellsokai 

set nocompatible
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Have a longer history
set history=1000

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Make tabs as wide as two spaces
set tabstop=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Indentation settings
set autoindent
set copyindent
set shiftwidth=4

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins here

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'sjbach/lusty'
Plugin 'Herzult/phpspec-vim'

Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'autotag'

Bundle 'joonty/vim-phpqa.git'

call vundle#end()
filetype plugin indent on
let mapleader=","

:set hidden 
:set expandtab

map <leader>src :!tree src<cr>

function! IPhpInsertUse()
     call PhpInsertUse()
     call feedkeys('a',  'n')
     call PhpSortUse()
endfunction
function! PhpInsertOrderedUse()
    call PhpInsertUse()
    call PhpSortUse()
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertOrderedUse()<CR>

" Ultisnips : trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Enable omni complete.
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

let g:phpqa_messdetector_ruleset = "/Users/alexismenard/phpmd/ruleset.xml"
let g:phpqa_codesniffer_args = "--standard=PSR2"

" Move with ctrl + HJKL to move between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
