" no compatible at the very start
set nocompatible
set nomodeline

" If vim-plug doesnt work correctly on fish shell, you might need to add this
" set shell=/bin/sh

" Automatic installation  of plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !mkdir -p ~/.local/share/nvim/plugged
    silent !mkdir -p ~/.local/share/nvim/site/autoload
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
    			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" base
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

" navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'vifm/vifm.vim', { 'on': 'Vifm' }
Plug 'easymotion/vim-easymotion'

" editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'

" language support
Plug 'tpope/vim-characterize'
Plug 'sheerun/vim-polyglot'
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'tpope/vim-afterimage'

" cosmetics
Plug 'ap/vim-css-color'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'dikiaap/minimalist'
"Plug 'chriskempson/base16-vim'

call plug#end()

" Force vim-sensible to load and allow override of options
runtime! plugin/sensible.vim

" turn on syntax detection
filetype plugin indent on
syntax on

" generate help for plugins
silent! helptags ALL

set termguicolors   " enable 24 bit colors
set hidden			    " buffers don't need to be saved to switch
set nowrap			    " don't wrap lines
set shiftround		  " use multiple of sw when indenting with '<' and '>'
set showmatch     	" set show matching parenthesis
set number        	" line numbers
" set relativenumber  " hybrid relative line numbers
set smartcase     	" ignore case if all lowercase, case-sensitive otherwise
set undolevels=1000 " use many muchos levels of undo
set novisualbell    " don't flash
set noerrorbells    " don't beep
set diffopt+=vertical " vertical layouts in diffs
set colorcolumn=80  " renders a column at 80 characters

" buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
nmap <C-1>1 <Plug>BufTabLine.Go(1)
nmap <C-2>2 <Plug>BufTabLine.Go(2)
nmap <C-3>3 <Plug>BufTabLine.Go(3)
nmap <C-4>4 <Plug>BufTabLine.Go(4)
nmap <C-5>5 <Plug>BufTabLine.Go(5)
nmap <C-6>6 <Plug>BufTabLine.Go(6)
nmap <C-7>7 <Plug>BufTabLine.Go(7)
nmap <C-8>8 <Plug>BufTabLine.Go(8)
nmap <C-9>9 <Plug>BufTabLine.Go(9)

" working with buffers
let g:BufKillOverrideCtrlCaret = 1
nnoremap <C-u> :bp<CR>
nnoremap <C-i> :bn<CR>
nnoremap <C-c> :BD<CR>
nnoremap <C-q> :bd<CR>

" easier buffer switch
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" change the mapleader from \ to spacebar
let g:mapleader = "\<SPACE>"

" delete whitespace
nmap <leader>w :%s/\s\+$//<CR>

" NERDTree setting stuff
nmap <silent> <leader>f :NERDTreeToggle<CR>
nmap <silent> <leader>ff :NERDTree<CR>
let NERDTreeHijackNetrw = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
" let NERDTreeIgnore = ['\.bs.js$']

" quit if no files left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open on startup
autocmd VimEnter * if !argc()
      \ |   exe 'Startify'
      \ |   wincmd w
      \ | endif

" Quickly edit the vimrc file
nmap <silent> <leader>c :vspl ~/.config/nvim/init.vim<CR>

" Quickly reload the vimrc file
nmap <silent> <leader>r :so ~/.config/nvim/init.vim<CR>

" turn off highlighting after compeleting a search
nmap <silent> <leader>/ :nohlsearch<CR>

" map escape to a more comfortable position
imap jj <Esc>

" open Startify window
nmap <silent> <leader>z :Startify<cr>

"jtab settings
set preserveindent " Preserve indent structure when changing indent level
set copyindent     " Copy the indent level of previous lines
set tabstop     =2 " The width of a \t is to 2.
set shiftwidth  =2 " Indents will have a width of 2
set softtabstop =2 " Sets the number of columns for a \t
set mouse=a        " I think it activates mouse mode for all something
set expandtab

" folding
let g:xml_syntax_folding = 0
set foldmethod=manual
set foldlevelstart=99

" splitjoin settings
let g:splitjoin_trailing_comma = 1

" Global colorization
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:enable_bold_font = 1
let g:enable_italic_font = 1

" set theme
colorscheme minimalist

" disable default EasyMotion mappings
let g:EasyMotion_do_mapping = 0

" Jump to anywhere you want with minimal keystrokes
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" replaces hybrid number+relativenumber mode
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" use X clipboard by default
" set clipboard=unnamedplus

" by default only - is a word separator
set iskeyword-=_

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" open current file on browser
nnoremap <leader>o :exe ':silent !firefox-beta %'<CR>

" disable polyglot to allow more specific language plugins
" let g:polyglot_disabled = ['jsx','javascript','javascript.jsx', 'styled-components']

" Yank text to the clipboard
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
let g:scala_sort_across_groups = 1

" vim-startify
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 0

