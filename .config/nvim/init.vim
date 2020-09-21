" no compatible at the very start
set nocompatible
set nomodeline

" if posix is needed uncomment this
"if &shell =~# 'fish$'
"set shell=/bin/sh
"endif

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
Plug 'tpope/vim-eunuch'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'svermeulen/vim-yoink'
Plug 'sjl/gundo.vim'

" navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

" editing
Plug 'machakann/vim-sandwich'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'matze/vim-move'
Plug 'mboughaba/vim-lessmess'

" language support
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
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

" turn on syntax detection
filetype plugin indent on
syntax on

" generate help for plugins
silent! helptags ALL

" disable swap files
set noswapfile

" disable backup files
set nobackup

" automatically change cwd to the one of the current open file
set autochdir

set complete-=t     " disable searching tags
set termguicolors   " enable 24 bit colors
set hidden          " buffers don't need to be saved to switch
set nowrap          " don't wrap lines
set shiftround      " use multiple of sw when indenting with '<' and '>'
set showmatch       " set show matching parenthesis
set number          " line numbers
set smartcase       " ignore case if all lowercase, case-sensitive otherwise
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

" should be done before Nerdtree start, at least its in the docs
autocmd StdinReadPre * let s:std_in=1

" nerdtree setting stuff
nmap <silent> <leader>f :NERDTreeToggle<CR>
nmap <silent> <leader>ff :NerdTreeFind<CR>
nmap <silent> <leader>F :NERDTree<CR>
let NERDTreeHijackNetrw = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2

" open on startup
autocmd VimEnter * if !argc()
      \ |   exe 'Startify'
      \ |   NERDTree
      \ |   wincmd w
      \ | endif

" quit if no files left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
      \ | q
      \ | endif

" quickly edit the vimrc file
nmap <silent> <leader>c :e $MYVIMRC<CR>

" quickly reload the vimrc file
nmap <silent> <leader>r :source $MYVIMRC<CR>

" turn off highlighting after compeleting a search
nmap <silent> <leader>/ :nohlsearch<CR>

" map escape to a more comfortable position
imap jj <Esc>

" open Startify window
nmap <silent> <leader>z :Startify<cr>

" tab settings
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

" by default only - is a word separator
set iskeyword-=_

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" open current file on browser
nnoremap <leader>o :exe ':silent !firefox-beta %'<CR>

" disable polyglot to allow more specific language plugins
" let g:polyglot_disabled = ['jsx','javascript','javascript.jsx', 'styled-components']

" Yank text to clipboard
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

" vim-startify
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 0

" vim-yoink
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" vim-gundo
nnoremap <leader>u :GundoToggle<CR>

" quick-scope
" trigger a highlight in the appropriate direction when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" quickly edit a macro
nnoremap <leader>q :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" only use cursor line when in the current window and not when being in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" quickly spawn new vertical split
nnore map <silent> vv <C-w>v
