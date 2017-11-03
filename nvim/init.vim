" http://help.adobe.com/ja_JP/AS2LCR/Flash_10.0/help.html?content=00000525.html
" s 115
" d 100
" f 102
" e 101

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vi互換 off
set nocompatible

" 文字コード
set encoding=utf-8

" シンタックスを明示的に有効化
set syntax=enable

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" 現在の行を強調表示
"set cursorline

" 折り返し無し
set nowrap

" 長い行の場合 続きがあることを示す
set listchars+=extends:»

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

" 表示の色がいい感じ (ターミナルが対応している必要がある)
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 折り返し時に表示行単位での移動できるようにする

" 見たまま移動
nnoremap j gj
nnoremap k gk

" 設定再読み込み
nnoremap <C-j><C-r> :source $XDG_CONFIG_HOME/nvim/init.vim<CR>:e!<CR><Esc>

" ファイル開く
nnoremap <C-j><C-e> :edit<Space>

" バッファ
nnoremap <C-b>q :bd<CR>
nnoremap <C-b><C-n> :enew<Space>
nnoremap <C-b><C-l> :buffers<CR>:b<Space>

" ウィンドウ
nnoremap <C-w>q :close<CR>
nnoremap <C-w>o :only<CR>
nnoremap <C-w><C-n> :vsplit<Space>
nnoremap <C-w><C-m> :split<Space>
nnoremap <C-w><C-s> <C-w>h
nnoremap <C-w><C-d> <C-w>j
nnoremap <C-w><C-f> <C-w>l
nnoremap <C-w><C-e> <C-w>k
nnoremap <C-w>s <C-w><S-h>
nnoremap <C-w>d <C-w><S-j>
nnoremap <C-w>f <C-w><S-l>
nnoremap <C-w>e <C-w><S-k>

nnoremap <C-w><C-w> :WinResizerStartResize<CR>
let g:winresizer_keycode_left = 115
let g:winresizer_keycode_right = 102
let g:winresizer_keycode_down = 100
let g:winresizer_keycode_up = 101
let g:winresizer_keycode_mode = 116
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

" markdow
autocmd BufNewFile,BufRead *.md :set filetype=markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'php', 'bash=sh']
