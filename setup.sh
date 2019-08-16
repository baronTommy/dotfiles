#!/bin/sh

# 環境変数
ln -s ~/dotfiles/.bash_profile ~/.
source ~/.bash_profile

mkdir -p $XDG_CONFIG_HOME/fish

ln -s ~/dotfiles/fish/fishfile $XDG_CONFIG_HOME/fish/.
ln -s ~/dotfiles/fish/config.fish $XDG_CONFIG_HOME/fish/.
ln -s ~/dotfiles/fish/functions/* $XDG_CONFIG_HOME/fish/functions/.
ln -s ~/dotfiles/fish/conf.d/* $XDG_CONFIG_HOME/fish/conf.d/.

# install
brew install fish
brew install fzf
brew install ghq
brew install terminal-notifier
brew install exa
brew install bat
brew install rust
brew install anyenv
brew install lsd
anyenv install pyenv
anyenv install nodenv

# fish
# manから補完
fish -c fish_update_completions

# fish -c fish_update_completions
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c fisher

