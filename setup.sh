#!/bin/sh

# 環境変数
ln -s ~/dotfiles/.bash_profile ~/.
source ~/.bash_profile

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/fish
ln -s ~/dotfiles/fish/fishfile $XDG_CONFIG_HOME/fish/.
ln -s ~/dotfiles/fish/functions/fzf_z.fish $XDG_CONFIG_HOME/fish/functions/.
ln -s ~/dotfiles/fish/conf.d/key_bindings.fish $XDG_CONFIG_HOME/fish/conf.d/.

# install
brew install fish
brew install fzf
brew install ghq

# fish & fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c fisher
