set -g foo 0

function fish_prompt
  if isSinple
    echo 'isSinple'
  end
  # echo '-'(whoami)
  echo '>'
end

# todo ショートカットでシンプルモードに変更
function isSinple
  return $foo
end
