#!/bin/sh

# 環境変数
ln -s ~/dotfiles/.bash_profile ~/.
source ~/.bash_profile

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/fish
ln -s ~/dotfiles/fish/fishfile $XDG_CONFIG_HOME/fish/.

# install
brew install fish
brew install fzf

# fish & fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c fisher
