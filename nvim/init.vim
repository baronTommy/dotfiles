" vi互換 off
set nocompatible

" 文字コード
set fenc=utf-8

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" 現在の行を強調表示
set cursorline

" 不可視文字を表示
set list

" 不可視文字の設定
" set listchars+=tab:^-
set listchars+=eol:⏎
set listchars+=space:_
set listchars+=trail:_
set listchars+=extends:«
set listchars+=precedes:»

" tabをスペースに
set expandtab

" tabをスペース4つ分で表示
set tabstop=4

" >> や autoindent
set shiftwidth=4

" インデントはスマートインデント
set smartindent

" 自動インデント
set autoindent

" ステータスラインを常に表示
set laststatus=2

" コマンドラインの補完
set wildmode=list:longest

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch


" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deinインストールディレクトリ
let s:dein_dir = $XDG_CACHE_HOME . '/dein'

" dein パス
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein 未インストールか判定
if !isdirectory(s:dein_repo_dir)
  " deinインストール
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" deinを実行パスに追加
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" dein管理対象プラグイン
let s:dein_toml = $XDG_CONFIG_HOME . '/nvim/toml/dein.toml'
let s:dein_lazy_toml = $XDG_CONFIG_HOME .'/nvim/toml/dein_lazy.toml'

" deinロード
if dein#load_state(s:dein_dir)

  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" dein管理対象をインストール
if dein#check_install()
  call dein#install()
endif

" nvalt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvalt like
call denite#custom#source('grep', 'args', ['', '', '!'])

" call denite#custom#var('grep', 'default_opts', ['-auto-preview'])
" call denite#custom#var('grep', 'args', ['./doc', '', '!'])
" call denite#custom#source('grep', 'args', ['', '', '!'])
" call denite#custom#source('grep', 'args', ['./doc2', '', '!'])
"call denite#custom#alias('source', 'nvalt', 'grep')
"call denite#custom#var('nvalt', 'command', ['grep', ['args', './doc']])
" 既存のコマンド上書き
" call denite#custom#source('grep', 'args', ['./doc'])
" :Denite grep -auto-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
