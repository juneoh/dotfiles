#!/bin/bash

sudo apt-get update
sudo apt-get install curl git zsh vim tmux

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# dotfiles
cd
git init
git remote add origin https://github.com/juneoh/dotfiles
git fetch origin master
git reset --hard origin/master
cd .zsh-pure
git submodule init
git submodule update
cd

echo "Installation complete. Open vi and run :PluginInstall for vi plugins."
