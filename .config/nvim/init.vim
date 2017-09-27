call plug#begin('~/.vim/plugged')

" Appearances: Colorschemes, bars
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil' 
Plug 'junegunn/vim-easy-align'


" Ale: Asynchronous linter
Plug 'w0rp/ale'

" AVR Assembly: Assembly syntax highlight
Plug 'VelkyVenik/vim-avr'

" Reason: Facebook Reason Support
" Plug 'reasonml/vim-reason-loader'

" Tmuxline: generate tmux theme to match lightline
Plug 'edkolev/tmuxline.vim'

" Git Wrapper: Shortcus to git commands
Plug 'tpope/vim-fugitive'

" Markdown: vim-markdown
Plug 'godlygeek/tabular' " requried by bim-markdown
Plug 'gabrielelana/vim-markdown'

" Syntastic: showing syntax errors
" Plug 'scrooloose/syntastic'

" Tmux Conf: syntax for tmux configuration
Plug 'keith/tmux.vim'

" Java Complete: java compete 2
Plug 'artur-shaik/vim-javacomplete2'

" Pairtools: auto complete brace
Plug 'MartinLafreniere/vim-PairTools'

" COOL: COOL syntax highlighter
" Plug 'vim-scripts/cool.vim'

" Vim Pencil: Writing enhancements
Plug 'reedes/vim-pencil'

" Goyo: Distraction free mode
Plug 'junegunn/goyo.vim'

" NerdTree: View files in sidebar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Deoplete: Asynchronous keyword completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

" Vim Multiple Cursors: Multiple cursors like Sublime Text
Plug 'wreed4/vim-multiple-cursors'

" Vim Clang Format: Format by `clang-format`
Plug 'rhysd/vim-clang-format'

call plug#end()


" Appearances
syntax on 

set background=light
colorscheme PaperColor
set t_ut=
set mouse=a

" Highlight 81st column and onwards 
let &colorcolumn=join(range(81,999),",")

set laststatus=2    " Otherwise lightline shows blank
let g:lightline = { 'colorscheme': 'PaperColor' }
set number          " show line number
set cursorline      " highlight the line that the cursor is at
set wildmenu        " command menu
set lazyredraw      " only redraw when needed
set showmatch       " highlight matching [{()}]

" Spaces & Tabs
set tabstop=4
set softtabstop=4 
set expandtab       " Use space instead of tab
filetype indent on  " Determine indent size based on filetype

" Searching
set incsearch       " Search as typing
set hlsearch        " Highlight matched words

" File
set autoread        " Set to auto read when a file is changed outside

" Plugins
filetype plugin on

" NERDTree Config
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Config cpp Mode
autocmd FileType cpp setlocal ts=2 sw=2 expandtab
autocmd FileType cpp let g:clang_format#code_style = 'google'

" Config lex Mode
autocmd FileType lex setlocal ts=2 sw=2 expandtab
autocmd FileType lex let &colorcolumn=join(range(101,999),",")

" Config sh Mode
autocmd FileType sh setlocal ts=2 sw=2 expandtab

" Config avr assembly Mode
autocmd FileType avr setlocal ts=4 sw=4 expandtab

" Config java Mode
autocmd FileType java setlocal ts=2 sw=2 expandtab
autocmd FileType java let g:pairtools_java_pairclamp = 1
autocmd FileType java let g:pairtools_java_jigsaw = 1
autocmd FileType java let g:pairtools_java_autoclose = 1
autocmd FileType java let g:pairtools_java_autoclose = 1
autocmd FileType java let g:pairtools_java_closepairs = "(:),[:],{:}" . ',":"'
autocmd FileType java let g:pairtools_java_smartclose = 1
autocmd FileType java let g:pairtools_java_smartcloserules = '\w,(,&,\*'
autocmd FileType java let g:pairtools_java_antimagic  = 1
autocmd FileType java let g:pairtools_java_antimagicfield  = "Comment,String,Special"
autocmd FileType java let g:pairtools_java_pcexpander = 1
autocmd FileType java let g:pairtools_java_pceraser   = 1
autocmd FileType java let g:pairtools_java_tagwrenchhook = 'tagwrench#BuiltinNoHook'
autocmd FileType java let g:pairtools_java_twexpander = 0
autocmd FileType java let g:pairtools_java_tweraser   = 0
autocmd FileType java let g:pairtools_java_apostrophe = 0


" Config ruby Mode
autocmd FileType ruby setlocal ts=2 sw=2 expandtab
autocmd FileType eruby setlocal ts=2 sw=2 expandtab

" Config Markdown Mode
let g:vim_markdown_toc_autofit = 1 " shrink if possible
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'reason=re']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter=1
let g:pencil#conceallevel=0 
set nofoldenable


" Config ALE
let g:ale_cpp_clang_options = '-std=c++11 -Wall'
let g:ale_cpp_clangcheck_options = '-extra-arg="-std=c++11"'

" Config Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'



