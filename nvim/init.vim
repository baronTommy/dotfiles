" キャッシュディレクトリ
if isdirectory($XDG_CACHE_HOME)
  echo  'ok'
endif
echo $XDG_CACHE_HOME

"  deinインストールディレクトリ
" let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
" let s:dein_dir = s:cache_home . '/dein'
