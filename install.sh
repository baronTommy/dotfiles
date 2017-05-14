#! /bin/bash

mkdir -p $XDG_CONFIG_HOME

# hammerspoon
ln -s ~/dotfiles/.hammerspoon ~/.

# nvim
ln -s ~/dotfiles/nvim $XDG_CONFIG_HOME/.

# bash
ln -s ~/dotfiles/.bash_profile ~/.

# new-filet-o-fish
git clone https://github.com/baronTommy/new-filet-o-fish.git ~/new-filet-o-fish
ln -s ~/new-filet-o-fish/hammerspoon_helper ~/.hammerspoon/.
