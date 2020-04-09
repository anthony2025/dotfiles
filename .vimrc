" no compatible at the very start
set nocompatible
set nomodeline

" Automatic installation  of plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
    			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" base 
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-characterize'

" navigation
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vifm/vifm.vim', { 'on': 'Vifm' }

" editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'

" language support
Plug 'sheerun/vim-polyglot'
" Plug 'othree/yajs.vim',
" Plug 'othree/es.next.syntax.vim'
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tpope/vim-afterimage'

" cosmetics
Plug 'ap/vim-css-color'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'dikiaap/minimalist'

call plug#end()

" Force vim-sensible to load and allow override of options
runtime! plugin/sensible.vim

" turn on syntax detection
filetype plugin indent on
syntax on

" generate help for plugins
silent! helptags ALL

set encoding=utf-8
set termguicolors   " enable 24 bit colors
set hidden			    " buffers don't need to be saved to switch
set nowrap			    " don't wrap lines
set shiftround		  " use multiple of sw when indenting with '<' and '>'
set showmatch     	" set show matching parenthesis
set number        	" line numbers
set relativenumber  " hybrid relative line numbers
set smartcase     	" ignore case if all lowercase, case-sensitive otherwise
set hlsearch      	" highlight search terms
set incsearch     	" show search matches as you type
set undolevels=1000 " use many muchos levels of undo
set novisualbell    " don't flash
set noerrorbells    " don't beep
set diffopt+=vertical " vertical layouts in diffs
set colorcolumn=80  " renders a column at 80 characters

" dangerous, disable swap files
set noswapfile

" buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" working with buffers
let g:BufKillOverrideCtrlCaret = 1
nnoremap <C-u> :bp<CR>
nnoremap <C-i> :bn<CR>
nnoremap <C-c> :BD<CR>
nnoremap <C-q> :bd<CR>

" easier buffer switch
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" change the mapleader from \ to ,
let g:mapleader=',' 

" Useful commands
" delete whitespace
nmap <leader>delw :%s/\s\+$//<CR>

" CtrlP Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'build\|target\|legacy\|coverage\|node_modules\|DS_Store\|git\|.git\|.bs.js'
" MRU shortcut
map <C-t> :CtrlPMRU<CR>
" Buffers shortcut
map <C-y> :CtrlPBuffer<CR>

" NERDTree setting stuff
nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTree<CR>
let NERDTreeHijackNetrw=0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
" let NERDTreeIgnore = ['\.bs.js$']

" quit if no files left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open on startup
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if !argc()
      \ |   exe 'Startify'
      " \ |   exe 'NERDTree'
      \ |   wincmd w
      \ | endif

" Quickly edit the vimrc file
nmap <silent> <leader>ev :vspl ~/.vimrc<CR>

" Quickly reload the vimrc file
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" turn off highlighting after compeleting a search
nmap <silent> <leader>/ :nohlsearch<CR>

" delimate cursor positioning after parens
imap <C-c> <CR><Esc>O

" map escape to a more comfortable position
imap jj <Esc>

" close buffer without killing window
map <C-c> :BD<cr>

" open Startify window
nmap <silent> <leader>z :Startify<cr>

" Tab Settings
set preserveindent " Preserve indent structure when changing indent level
set copyindent     " Copy the indent level of previous lines
set tabstop     =2 " The width of a \t is to 2.
set shiftwidth  =2 " Indents will have a width of 2
set softtabstop =2 " Sets the number of columns for a \t
set mouse=a        " I think it activates mouse mode for all something
set autoread
set expandtab
set colorcolumn=100

" Tab Settings
augroup Javascript
	autocmd FileType javascript set ts=2 sts=2 sw=2 cole=1 et
augroup END

" NERD commenter settings
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

" Syntax specific stuff
" vim-javascript
let g:javascript_plugin_flow = 1
" activating this thing might break jsx hightlighting
let g:xml_syntax_folding = 0
set foldmethod=manual
set foldlevelstart=99
let g:splitjoin_trailing_comma = 1

" Global colorization
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:enable_bold_font = 1
let g:enable_italic_font = 1
set background=dark
colorscheme minimalist

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding. `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" make copy paste a bit easier
set clipboard=unnamed

" by default only - is a word separator
set iskeyword-=_

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" for split-term
let g:split_term_vertical = 1

" open current file on browser
nnoremap <F9>c :exe ':silent !chromium-browser %'<CR>

" disable polyglot for javascript in favor of yay.js
let g:polyglot_disabled = ['jsx','javascript','javascript.jsx', 'styled-components']

" Yank text to the OS clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'readonly', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \           [ 'percent' ],
      \           [ 'fileformat', 'filetype'] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" disable annoying man page shortcut
nnoremap <S-k> <Nop>

" vim-scala
let g:scala_sort_across_groups=1

" vim-startify
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 0
