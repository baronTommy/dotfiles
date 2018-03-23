function __echo --argument v setColor
  if test -z $setColor;
    set setColor normal
  end

  set_color -o $setColor
  echo -e $v;
  set_color normal
end

function __blankLine
  __echo ''
end

function __starLine
  __echo '★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★' brblack
end

function __currentDatetime
  __echo 'Current datetime is ...' green
  __echo '🗓️  '(date +'%Y-%m-%d %H:%M:%S')
end

function __currentDirectory
  __echo 'Current Directory is ...' yellow
  __echo '📁  '(pwd)
end

function __whoAmI
  __echo 'Login User is ...' magenta
  __echo '👽  '(whoami)
end

function fish_greeting
  __starLine

  __currentDatetime
  __blankLine

  __currentDirectory
  __blankLine

  __whoAmI
  __starLine
end
