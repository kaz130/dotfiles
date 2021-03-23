if has('vim_starting')
    set encoding=utf-8
endif

scriptencoding utf-8

augroup init_vim
    autocmd!
augroup END

filetype off
filetype plugin indent off

let g:rc_dir = $XDG_CONFIG_HOME . '/nvim'
let mapleader = ','

" vim-plug {{{
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'

Plug 'thinca/vim-template'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'kana/vim-submode'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tyru/caw.vim'

Plug 'cocopon/iceberg.vim'

Plug 'osyo-manga/vim-over'

Plug 'shinespark/vim-list2tree'

Plug 'pixelneo/vim-python-docstring'

Plug 'davidhalter/jedi-vim'

call plug#end()

" }}}

" setting {{{
syntax on
if filereadable(expand(stdpath('data') . '/plugged/iceberg.vim/colors/iceberg.vim'))
    colorscheme iceberg
endif

" utf-8 でエンコーディング
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

" スワップファイル
set swapfile
set directory=$XDG_CACHE_HOME/vim/swap
set updatecount=200
set updatetime=4000

" バックアップファイル
set backup
set backupdir=$XDG_CACHE_HOME/vim/backup
set backupcopy=yes
set backupext=~

" アンドゥファイル
set undofile
set undodir=$XDG_CACHE_HOME/vim/undo
set undolevels=200

" netrw
let g:netrw_home=$XDG_CACHE_HOME . '/vim/netrw'
let g:loaded_netrwPlugin = 1

" viminfo
if !has('nvim')
    set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
endif

" 100操作までコマンド履歴を残す
set history=100

" スクロールする時に3行余裕を持たせる
set scrolloff=3

" インデント
set tabstop=4
set shiftwidth=4
set softtabstop=0
set shiftround
set autoindent
let g:vim_indent_cont=4

" <Tab>で空白を挿入する
set expandtab

" エラー時にベルを鳴らさない
set t_vb=
set visualbell
set noerrorbells

" 不可視文字を表示
set list
set listchars=tab:>-,trail:_,nbsp:%

" 行数を表示
set number

" ルーラーを表示
set ruler

" ステータスバーを表示
set laststatus=2

" コマンドラインの高さ
set cmdheight=2

" コマンドを画面の最下行に表示
set showcmd

" 対応括弧を3秒間ハイライトする
set showmatch
set matchtime=3

" ウィンドの幅よりも長いテキストをり返す
set wrap

" ウィドウサイズを超える入力を改行で折り返さない
set textwidth=0

" 単語単位でファイルを折り返す
" set linebreak

" 移動コマンドを使用した時に、行頭に移動
" CTRL-D, CTRL-U, "G" などのコマンドに適用される
set startofline

" markerでファイルを折りたたむ
set foldmethod=marker
set foldcolumn=0
set foldlevel=2

" マウス操作を無効にする
set mouse=

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 短形ヴィジュアルモードで仮想編集を有効にする
set virtualedit=block

" インデント・改行を超えてバックスペースを働かせる
set backspace=indent,eol

" バックスペースとスペースを行頭/末で移動できるようにする
set whichwrap=s

" コマンドライン補完
set wildmenu
set wildmode=longest:full,full

" インクリメント・デクリメントをアルファベットに対しても有効にする
" 8進数と16進数に対しては無効にする
set nrformats=alpha

" ターミナルのウィンドウタイトルのタイトルに何も設定しない
set notitle

" 大文字小文字両方が含まれている場合のみ区別して検索する
set ignorecase
set smartcase

" 検索結果をハイライト表示
set hlsearch

" 末尾まで検索した後、ファイル先頭から再び検索する
set wrapscan

" 補完時に表示されるプレビューウィンドウを消す
set completeopt=menuone

" マッピングは500ミリ秒待つ
" キーコードは即座にタイムアウト
set timeout
set ttimeout
set timeoutlen=500
set ttimeoutlen=0

" .tex ファイルは基本的に LaTeX として設定する
let g:tex_flavor = "latex"

" conceal を無効化
set conceallevel=0

" provider
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
" }}}

" mapping {{{
" <C-u> キー入力前の範囲指定の数字を削除する
" <CR> キャリッジリターン

" xキーで削除した内容を無名レジスタに格納しない
noremap x "_x

" 直感的に移動する
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" sキーでウィンドウやタブを操作する
noremap s <Nop>
" split window
noremap ss :<C-u>split<CR>
noremap sv :<C-u>vsplit<CR>
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sw <C-w>w
noremap sH <C-w>H
noremap sJ <C-w>J
noremap sK <C-w>K
noremap sL <C-w>L
noremap sx <C-w>x
noremap sr <C-w>r
noremap sR <C-w>R
noremap sT <C-w>T
noremap so <C-w>o
noremap s= <C-w>=
noremap s> <C-w>>
noremap s< <C-w><
noremap s+ <C-w>+
noremap s- <C-w>-
" tab
noremap st :<C-u>tabnew<CR>
noremap sn gt
noremap sp gT
noremap sq :<C-u>quit<CR>
noremap sQ :<C-u>bdelete<CR>

noremap Y y$

" スペースキー
noremap <Space> <NOP>
noremap <Space>/ *
noremap <Space>m %
if has('mac')
    noremap <silent> <Space>o :<C-u>!open %:h<CR>
    noremap <silent> <Space><S-o> :<C-u>!open .<CR>
    noremap <silent> <Space><C-o> :<C-u>!open %:p<CR>
endif

" クリップボードを使ってヤンク・ペースト
noremap <Space>y "*y
noremap <Space>Y "*y$
noremap <Space>p "*p
noremap <Space>P "*P

" h,lキー・方向キー
noremap <S-h> ^
noremap <S-l> $
noremap <S-Left> ^
noremap <S-Right> $
noremap <Up> <C-y>
noremap <Down> <C-e>
noremap <S-Up> <S-h>
noremap <S-Down> <S-l>

" <ESC>2回で検索結果のハイライトを無効化
noremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" 誤操作しやすいキーの無効化
nnoremap ZQ :<C-u>q<CR>

" ビジュアルモード
" 選択した部分をアスタリスクキーで検索
" 選択した文字列をヤンク
" ヤンクされた文字を最終検索パターン用レジスタに格納して検索
vnoremap * y:<C-u>let @/ = @0<CR>n

" ターミナルモード
" <Esc>でターミナルモードを解除
tnoremap <Esc> <C-\><C-n>

" <Space>p を再設定
autocmd TermOpen * noremap <buffer> <Space>p <Nop>
autocmd TermOpen * noremap <buffer> <Space>P <Nop>
autocmd TermOpen * noremap <buffer> <Space><Space>p "+p
autocmd TermOpen * noremap <buffer> <Space><Space>P "+P

" }}}

" autocmd / function {{{
" terminalモードで行番号を非表示
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

" ファイルを開いた時に、以前のカーソル位置を復元する
function! s:RestoreCursorPostion()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
autocmd init_vim BufWinEnter * call s:RestoreCursorPostion()
" }}}

" plugin {{{
" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" lightline {{{
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightLineModified',
    \   'readonly': 'LightLineReadonly',
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \   'fileformat': 'LightLineFileformat',
    \   'filetype': 'LightLineFiletype',
    \   'fileencoding': 'LightLineFileencoding',
    \   'mode': 'LightLineMode'
    \ }
    \ }

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunctio

" }}}

" neosnippet {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" snippets
let g:neosnippet#snippets_directory = $XDG_CONFIG_HOME . '/nvim/snippets'

" }}}

" vim-submode {{{
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" }}}

" nerdtree {{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" }}}

" caw {{{
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap <Leader>C <Plug>(caw:wrap:comment)
vmap <Leader>C <Plug>(caw:wrap:comment)
" }}}

" vim-over {{{
nnoremap <silent> <Leader>: :OverCommandLine<CR>
vnoremap <silent> <Leader>: :OverCommandLine<CR>

" }}}

" vim-list2tree {{{
vnoremap <Leader>t :<c-u>'<,'>List2Tree<CR>
" }}}
" }}}
