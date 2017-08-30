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

" Reason: Facebook Reason Support
" Plug 'reasonml/vim-reason-loader'

" Git Wrapper: Shortcus to git commands
Plug 'tpope/vim-fugitive'

" Markdown: vim-markdown
Plug 'godlygeek/tabular' " requried by bim-markdown
Plug 'gabrielelana/vim-markdown'

" Syntastic: showing syntax errors
" Plug 'scrooloose/syntastic'

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

call plug#end()


" Appearances
syntax on 

set background=dark
colorscheme tender 
set t_ut=

set laststatus=2    " Otherwise lightline shows blank
let g:lightline = { 'colorscheme': 'tender' }
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

" Config cpp Mode
autocmd FileType cpp setlocal ts=4 sw=4 expandtab

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
