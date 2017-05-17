" Use the Solarized Dark theme

" colorscheme wellsokai
colorscheme base16-monokai
" colorscheme wombat

set nocompatible
set clipboard=unnamedplus
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

noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
	" Treat .dist as YML.
	autocmd BufNewFile,BufRead *.dist setfiletype yml syntax=yml

    " Permits to open nerdtree automatically if no specified file is edited
    " when typing "vim" or "v".
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
    "Permits to close vim if the only left tab is the nerdtree.
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins here

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'sjbach/lusty'
Plugin 'Herzult/phpspec-vim'
Plugin 'evidens/vim-twig'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
" Plugin 'ervandew/supertab'
Plugin 'vim-scripts/AutoComplPop'

Plugin 'chriskempson/base16-vim'

Bundle 'arnaud-lb/vim-php-namespace'

Bundle 'joonty/vim-phpqa.git'

call vundle#end()
filetype plugin indent on
let mapleader=","

:set hidden 
:set expandtab

map <leader>src :!tree src<cr>

" Nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

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
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerdtree : CTRL+N toggle
map <C-n> :NERDTreeToggle<CR>

" Enable omni complete.
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

let g:phpqa_messdetector_ruleset = "/Users/alexismenard/phpmd/ruleset.xml"
let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_open_loc = 0

" Move with ctrl + HJKL to move between windows
inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "<C-W>j<C-W>_"
inoremap <expr> <C-P> pumvisible() ? "\<C-p>" : "<C-K> <C-W>k<C-W>_"
noremap <silent> <C-H> <C-W>h<C-W>_
noremap <silent> <C-L> <C-W>l<C-W>_

inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "<Esc><C-W>j<C-W>_"
inoremap <expr> <C-K> pumvisible() ? "\<C-p>" : "<Esc><C-W>k<C-W>_"
inoremap <silent> <C-H> <Esc><C-W>h<C-W>_
inoremap <silent> <C-L> <Esc><C-W>l<C-W>_

set omnifunc=syntaxcomplete#Complete
" set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Fixes the annoying pum enter doing a line break when you dont need to
imap <expr> <CR> pumvisible() ? "" : "<CR>"


" jk simulates ESC press.
:imap jk <Esc>
:imap wjk <Esc>:w<CR>

" For herzult ctags
set tags+=vendor.tags

" Comments easily.
map <Leader>gc :Commentary<CR>

" Easy delete in black hole
nnoremap <Leader>d "_dd
vnoremap <Leader>d "_dd

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

au BufNewFile,BufRead *.ejs set filetype=html

" Swapping :)
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-p> :call <SID>swap_up()<CR>
noremap <silent> <c-s-m> :call <SID>swap_down()<CR>

noremap <Leader>qpc :!bin/phpunit %<CR>

hi Normal ctermbg=235

" Command T conf
let g:CommandTMaxFiles=400000
" let g:CommandTFileScanner = "git"
let g:CommandTFileScanner = "watchman"
" For watchman : not ignoring anything
let g:CommandTWildIgnore = ""
let g:CommandTMaxDepth=30

" Jump to a tag with <Leader>o
nnoremap <Leader>o :tag <c-r><c-w><cr>
