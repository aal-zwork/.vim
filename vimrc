set langmenu=en_US
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1251,koi8-r,utf-16le,default,latin1
let $LANG = 'en_US.utf-8'

if has('win32') || has ('win64')
    let $VIMSD = "vimfiles"
else
    let $VIMSD = ".vim"
endif

set nocompatible
filetype off
set rtp+=~/$VIMSD/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'perl-support/perl-support.vim'
Plugin 'vim-perl/vim-perl.vim'
Plugin 'nerdtree/nerdtree.vim'
"Plugin 'tpope/vim-surround.vim'
Plugin 'easymotion/vim-easymotion.vim'
Plugin 'jumegunn/fzf'
Plugin 'jumegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter.vim'
Plugin 'ryanoasis/vim-devicons.vim'
call vundle#end()
filetype plugin indent on


"
" UI Layout {{{
"
set number
set ruler
set showcmd
set nocursorline
set wildmenu
set lazyredraw
set showmatch
colorscheme 256-jungle
colorscheme gruvbox
syntax on
set mouse=a
set fileformats=unix,dos,mac
set scrolloff=5
" set list
set backspace=indent,eol,start
" gui font and etc
" set guioptions-=T
" set guioptions-=m
if has("gui_win32")
  set guifont=Cousine\ Nerd\ Font\ Mono:h10
  set lines=999 columns=140
  set linespace=0
end
set laststatus=2
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
" }


"
" Spaces & Tabs {{{
"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set modelines=1
set autoindent
set expandtab
set nowrap
" indent lines if wrapping is enabled
set breakindent
" do not brake words if wrapping is enabled
set linebreak
set scrolloff=4
set winminheight=0
set foldmethod=indent
" set foldlevelstart=99
" }


"
" Searching
"
set ignorecase
set incsearch
set hlsearch
set showmatch
" }


"
" TMP files {{{
"
set writebackup
set undofile
set backup
set undodir=~/$VIMSD/.vim-tmp/undo//
set backupdir=~/$VIMSD/.vim-tmp/backup//
set directory=~/$VIMSD/.vim-tmp/swap//
set undodir=~/$VIMSD/.vim-tmp/undo//
"maximum number of changes that can be undone
set undolevels=1000
"maximum number lines to save for undo on a buffer reload
set undoreload=10000
set history=50
" Return to last edit position when opening
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
" }}}


"
" strip white spaces, tabstop and other extention conf {{{
"
function! s:StripTrailingWhitespaces()
    normal mZ
    let l:chars = col("$")
    %s/\s\s+$//e
    if (line("'Z") != line(".")) || (l:chars != col("$"))
        echo "Trailing whitespace stripped\n"
    endif
    normal `Z
endfunction

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
" }}}


"
" NERDTree {{{
"
silent! map <F3> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
\  'ledger': { 'left': ';' },
\  'jcPrj': { 'left': '%' },
\  'benchTsk': { 'left': '#' }
\}
let g:NERDTreeIgnore=['\~$', '\.hi$', '\.o$', '\.class$']
let g:NERDTreeChDirMode=2 " cwd when root is changed
let g:NERDTreeHighlightCursorline=0
" vifm-like bindings:
let g:NERDTreeMapActivateNode="l"
let g:NERDTreeMapCloseDir="h"
let g:NERDTreeMapOpenSplit="L"
" }}}


"
" Perl-support {{{
"
let g:Perl_SyntaxCheckOnlyFile = 'yes'
let g:Perl_Ctrl_j = 'no'
" }}}
"
"
" gitgutter {{{
"
silent! map <F4> :GitGutterToggle<CR>
" }}}


" Open vifm in single pane mode
let g:vifm_exec_args = "-c only -c 'set vifminfo-=tui'"

let g:AutoCloseExpandSpace = 0


"
" map keys
"
"
" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

map ; <Plug>(easymotion-prefix)
" kj to go back into normal mode
inoremap kj <esc>
cnoremap kj <C-C>
" tab moving
nmap \tn :tabnext<CR>
nmap \tp :tabprevious<CR>
nmap \tN :tabnew<CR>
" windows moving
nmap <TAB> <C-w>w
nmap <S-TAB> <C-w>p
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-n> <C-w>n
nmap <F11> <C-w>=
nmap <F12> <C-w>_
" Rus command
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

