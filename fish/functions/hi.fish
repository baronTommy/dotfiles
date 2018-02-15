function hi
  set -g foo 1
  echo 'hello'
  echo -e '\n'
  commandline -f repaint
  return 1
end
