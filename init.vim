call plug#begin('~/.config/nvim/plugged')
"# ranger的nvim插件，文件浏览
Plug 'kevinhwang91/rnvimr', {'do': 'make sysc'}
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
nmap <silent> <F4> :TagbarToggle<CR>  
let g:tagbar_ctags_bin = 'ctags'  
let g:tagbar_width = 25

"# 代码智能补全
"# 如果使用python，最好选择mpls，若选择jedi，会导致一个变量后的方法名无法补全
" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'

let g:python3_host_prog='/usr/bin/python3'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" 指定 Python 版本
let g:ncm2_jedi#python_version = 3

let g:ncm2#match_highlight = 'sans-serif'

"# 自己的代码片段
" Plug 'SirVer/ultisnips'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'vim-scripts/indentpython.vim'

"# markdown预览
"Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

"# 彩虹括号
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"文件树
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 文件树设置 {{{
" 自动打开 nerdtree
" autocmd vimenter * NERDTree
" 关闭NERDTree快捷键
map <C-n> :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.git$', '\.venv$', '\.pyc$', '__pycache__',
                    \ '.vscode$'
                    \ ]
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" 注释
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"============================================================================
set number
syntax on
" set mouse=a
set encoding=utf-8
set t_Co=256
filetype indent on
set autoindent
set tabstop=4
set ts=4
set expandtab
set softtabstop=4
set cursorline
set linebreak
set showmatch
set hlsearch
set helplang=cn
set wildmenu
set foldenable
set clipboard=unnamedplus
set relativenumber

" ======================================== 设置状态栏格式(begin) ========================================
set statusline=%1*\%<%.50F\                                     "显示文件名和文件路径
set statusline+=%=%2*\%y%m%r%h%w\ %*                            "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*                       "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*                       "显示光标所在行和列
set statusline+=%5*\%3p%%\%*                                    "显示光标前文本所占总文本的比例
hi User1 cterm=none ctermfg=25 ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0
" ======================================== 设置状态栏格式(end) ========================================

" --------------- ctrlp -------
let g:ctrlp_map = '<c-p>'

" --------------- vim-easymotion -------
nmap ss <Plug>(easymotion-s2)

" --------------- vim-easymotion -------
let g:rainbow_active = 1

" --------------- vim-gitgutter -------
set updatetime=300

" --------------- morhetz/gruvbox -------
colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None

" ======================================== 文件头设置(start) ========================================
" --------------- shell ---------------
autocmd BufNewFile *.sh exec ":call AddTitleForShell()"
function AddTitleForShell()
        call append(0, "#!/bin/bash")
        call append(1, "")
endfunction

" --------------- python3 ---------------
autocmd BufNewFile *.py exec ":call AddTitleForPython3()"
function AddTitleForPython3()
        call append(0, "#!/usr/bin/env python3")
        call append(1, "# -*- coding:utf-8 -*-")
        call append(2, "")
        call append(3, "'''")
        call append(4, "@File :  ".expand("%:t").expand("  "))
        call append(5, "@Desc :  ")
        call append(6, "'''")
        call append(7, "")
        call append(8, "# The Python Standard Modules(Library) and Third Modules(Library)")
        call append(9, "")
        call append(10, "# User-defined Modules")
        call append(11, "")
endfunction

" ======================================== 文件头设置(end) ========================================

" ======================================== coc.nvim(start) ========================================
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']
" TextEdit might fail if hidden is not set.
set hidden
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <C-h> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@









" ======================================== coc.nvim(end) ========================================
