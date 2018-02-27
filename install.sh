#! /bin/bash

mkdir -p $XDG_CONFIG_HOME

# hammerspoon
ln -s ~/dotfiles/.hammerspoon ~/.

# nvim
ln -s ~/dotfiles/nvim $XDG_CONFIG_HOME/.

# bash
ln -s ~/dotfiles/.bash_profile ~/.
ln -s ~/dotfiles/.bashrc ~/.

########################################################################
# new-filet-o-fish
git clone https://github.com/baronTommy/new-filet-o-fish.git ~/new-filet-o-fish
ln -s ~/new-filet-o-fish/hammerspoon_helper ~/.hammerspoon/.


# fish
ln -s ~/dotfiles/fish ~/.config
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher


# コマンドラインお助け
git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
sudo python setup.py install

# powerline
# git clone https://github.com/powerline/fonts.git
# fonts/install.sh
# rm -rf fonts
