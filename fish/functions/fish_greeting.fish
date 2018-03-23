function __echo --argument v prefixFlg
  if test -z $prefixFlg;
    set prefixFlg false
  end

  set -l prefix \t
  if test $prefixFlg = true;
    echo -n $prefix
  end

  echo $v
end

function __breakLine
  __echo '' false
end

function fish_greeting
  __echo 'Current time is ...'
  __echo (date +'%Y-%m-%d %H:%M:%S') true
  __breakLine

  __echo 'Current Directory is ...'
  __echo (pwd) true
  __breakLine

  __echo 'Login User is ...'
  __echo (whoami) true
  __breakLine
end
