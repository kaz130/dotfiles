if has('vim_starting')
    set encoding=utf-8
endif

scriptencoding utf-8

augroup init_vim
    autocmd!
augroup END

filetype off
filetype plugin indent off

let mapleader = ','

syntax enable

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

" tex の conceal を無効化
let g:tex_conceal = ''

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
noremap sr <C-w>r
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

" <ESC>2回で検索結果のハイライトを無効化
noremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" 誤操作しやすいキーの無効化
nnoremap ZQ :<C-u>q<CR>

" ビジュアルモード
" 選択した部分をアスタリスクキーで検索
" 選択した文字列をヤンク
" ヤンクされた文字を最終検索パターン用レジスタに格納して検索
vnoremap * y:<C-u>let @/ = @0<CR>n

" autocmd / function {{{
" ファイルを開いた時に、以前のカーソル位置を復元する
function! s:RestoreCursorPostion()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
autocmd init_vim BufWinEnter * call s:RestoreCursorPostion()
" }}}

