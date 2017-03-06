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
