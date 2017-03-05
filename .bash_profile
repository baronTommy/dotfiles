# 設定ファイルパス
export XDG_CONFIG_HOME=$HOME/.config

# キャッシュパス
export XDG_CACHE_HOME=$HOME/.cache

# pyenv
#export PYENV_ROOT="${HOME}/.pyenv"
#export PATH="${PYENV_ROOT}/bin:$PATH"
#eval "$(pyenv init -)"

# go
# mkdir -p ~/go/third-party/bin
# mkdir -p ~/go/my-project/bin
export GOPATH_THIRD_PARTY=~/go/third-party
export GOPATH_MY_PROJECT=~/go/my-project
export GOPATH=$GOPATH_THIRD_PARTY:$GOPATH_MY_PROJECT

# PATH
export PATH=$PATH:$GOPATH_THIRD_PARTY/bin:$GOPATH_MY_PROJECT/bin

# mkdir -p $XDG_CONFIG_HOME
# mkdir -p $XDG_CACHE_HOME
