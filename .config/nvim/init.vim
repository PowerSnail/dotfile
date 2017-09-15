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


" Config Reason Mode
" keybindings
autocmd FileType reason map <buffer> <C-M> :ReasonPrettyPrint<Cr> 
autocmd FileType reason let g:pairtools_reason_pairclamp = 1
autocmd FileType reason let g:pairtools_reason_tagwrench = 0
autocmd FileType reason let g:pairtools_reason_jigsaw    = 1
autocmd FileType reason let g:pairtools_reason_autoclose  = 1
autocmd FileType reason let g:pairtools_reason_forcepairs = 0
autocmd FileType reason let g:pairtools_reason_closepairs = "(:),[:],{:}" . ',":"'
autocmd FileType reason let g:pairtools_reason_smartclose = 1
autocmd FileType reason let g:pairtools_reason_smartcloserules = '\w,(,&,\*'
autocmd FileType reason let g:pairtools_reason_antimagic  = 1
autocmd FileType reason let g:pairtools_reason_antimagicfield  = "Comment,String,Special"
autocmd FileType reason let g:pairtools_reason_pcexpander = 1
autocmd FileType reason let g:pairtools_reason_pceraser   = 1
autocmd FileType reason let g:pairtools_reason_tagwrenchhook = 'tagwrench#BuiltinNoHook'
autocmd FileType reason let g:pairtools_reason_twexpander = 0
autocmd FileType reason let g:pairtools_reason_tweraser   = 0
autocmd FileType reason let g:pairtools_reason_apostrophe = 0

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


" Config Merlin
set rtp+=/home/henry/.opam/4.02.3/share/merlin/vim



" =================== ADDED by OPAM ====================
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
