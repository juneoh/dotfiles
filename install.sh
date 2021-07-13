#!/bin/bash

set -ex

# Install base packages

sudo apt-get update
sudo apt-get install git zsh vim tmux stow

# Install oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone repo and create links

mv .zshrc .zshrc.bak
cd
git clone https://github.com/juneoh/dotfiles --recursive --depth 1 --branch develop .dotfiles
cd .dotfiles
stow dotfiles

# Install vim plugins

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vi +PluginInstall +qall

# Install Python packages

pip install flake8 mypy pylint
