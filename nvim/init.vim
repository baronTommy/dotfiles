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
