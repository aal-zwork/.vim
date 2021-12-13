set langmenu=en_US
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1251,koi8-r,utf-16le,default,latin1
let $LANG = 'en_US.utf-8'
let $GIT_ASKPASS='true'

if has('win32') || has ('win64')
    let $VIMSD = "vimfiles"
else
    let $VIMSD = ".vim"
endif


" Vundle
let $vundle_path = '~/' . $VIMSD . '/bundle/Vundle.vim'
if filereadable(expand($vundle_path . '/README.md'))
    set nocompatible
    filetype off
    set rtp+=$vundle_path
    call vundle#begin()
    "Plugin 'morhetz/gruvbox'
    Plugin 'rafi/awesome-vim-colorschemes'
    Plugin 'aal-zwork/perl-support'
    Plugin 'vim-perl/vim-perl'
    Plugin 'preservim/nerdtree'
    "Plugin 'tpope/vim-surround.vim'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'junegunn/fzf.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'chase/vim-ansible-yaml'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'junegunn/fzf'
    call vundle#end()
    filetype plugin indent on
end


" UI Layout
set background=dark
set t_Co=256
"let g:gruvbox_termcolors=16
colorscheme gruvbox
syntax on
set number
set ruler
set showcmd
set nocursorline
set wildmenu
set lazyredraw
set showmatch
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
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set nolist


" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set modelines=1
set autoindent
set nowrap
" indent lines if wrapping is enabled
set breakindent
" do not brake words if wrapping is enabled
set linebreak
set scrolloff=4
set winminheight=0
set foldmethod=indent
" set foldlevelstart=99


" Searching
set ignorecase
set incsearch
set hlsearch
set showmatch


" TMP files {{{
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


" This is the default extra key bindings
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fp :Files<CR>
nnoremap <silent> <Leader>ff :Ag<CR>
nnoremap <silent> <Leader>fr :Rg<CR>
nnoremap <silent> <Leader>f/ :BLines<CR>
nnoremap <silent> <Leader>f' :Marks<CR>
nnoremap <silent> <Leader>fg :Commits<CR>
nnoremap <silent> <Leader>ft :Helptags<CR>
nnoremap <silent> <Leader>fhh :History<CR>
nnoremap <silent> <Leader>fh: :History:<CR>
nnoremap <silent> <Leader>fh/ :History/<CR> 

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" CTRLP
nnoremap <silent> <Leader>cb :CtrlPBuffers<CR>
nnoremap <silent> <Leader>cp :CtrlPCurWD<CR>
nnoremap <silent> <Leader>c/ :CtrlPLine<CR>
nnoremap <silent> <Leader>cg :CtrlPChangeAll<CR>
nnoremap <silent> <Leader>ct :Helptags<CR>
nnoremap <silent> <Leader>chh :History<CR>
nnoremap <silent> <Leader>ch: :History:<CR>
nnoremap <silent> <Leader>ch/ :History/<CR> 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" strip white spaces, tabstop and other extention conf
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
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb,*.yaml,*.yml :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter Makefile setlocal tabstop=8
    autocmd BufEnter Makefile setlocal softtabstop=8
    autocmd BufEnter Makefile setlocal shiftwidth=8
    autocmd BufEnter *.sh,*.yml,*.yaml setlocal tabstop=2
    autocmd BufEnter *.sh,*.yml,*.yaml setlocal shiftwidth=2
    autocmd BufEnter *.sh,*.yml,*.yaml setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
augroup Binary
    au!
    au BufReadPre  *.exe,*.bin,*.iso,*.img let &bin=1
    au BufReadPost *.exe,*.bin,*.iso,*.img if &bin | %!xxd
    au BufReadPost *.exe,*.bin,*.iso,*.img set ft=xxd | endif
    au BufWritePre *.exe,*.bin,*.iso,*.img if &bin | %!xxd -r
    au BufWritePre *.exe,*.bin,*.iso,*.img endif
    au BufWritePost *.exe,*.bin,*.iso,*.img if &bin | %!xxd
    au BufWritePost *.exe,*.bin,*.iso,*.img set nomod | endif
augroup END


" NERDTree
if filereadable(expand('~/' . $VIMSD . '/bundle/nerdtree/README.markdown'))
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
end


" Perl-support
if filereadable(expand('~/' . $VIMSD . '/bundle/perl-support/README.md'))
    let g:Perl_SyntaxCheckOnlyFile = 'yes'
    let g:Perl_Ctrl_j = 'no'
end


" gitgutter
if filereadable(expand('~/' . $VIMSD . '/bundle/vim-gitgutter/README.mkd'))
    silent! map <F4> :GitGutterToggle<CR>
end


" easymotion 
if filereadable(expand('~/' . $VIMSD . '/bundle/vim-easymotion/README.md'))
    map ; <Plug>(easymotion-prefix)
end


" Open vifm in single pane mode
let g:vifm_exec_args = "-c only -c 'set vifminfo-=tui'"
let g:AutoCloseExpandSpace = 0

map <Space> <Leader>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

function! ToggleNumber()
    let flag=&number
    if flag
        set nonumber
    else
        set number
    endif
endfunction
map <F8> :call ToggleNumber()<CR>
function! ToggleList()
    let flag=&list
    if flag
        set nolist
    else
        set list
    endif
endfunction
map <F9> :call ToggleList()<CR>

" map keys
" replace currently selected text with default register
" without yanking it
" vnoremap <Leader>p "_dP

" Shift visual block
vnoremap > >gv
vnoremap < <gv

" kj to go back into normal mode
inoremap kj <esc>
cnoremap kj <C-C>

" tab moving
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>tN :tabnew<CR>
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

"vnoremap <C-c> "+y
"vnoremap <C-v> "+p
" resize window
nnoremap <silent> + :exe "resize " . (winheight(0) * 10/9)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 9/10)<CR>
" resize window
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 9/10)<CR>

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

