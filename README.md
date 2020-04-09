# Dotfiles

Personal dotfiles.

- terminal multiplexer: tmux
  - color scheme: custom adaptation of hyper-snazzy
- shell: zsh
  - plugin manager: [oh-my-zsh](http://ohmyz.sh/)
  - prompt: [pure](https://github.com/sindresorhus/pure)
- editor: VIM
  - plugin manager: [Vundle](https://github.com/VundleVim/Vundle.vim)
  - plugins: refer to `.vimrc` file.
- cosmetics
  - color scheme: [hyper-snazzy](https://github.com/sindresorhus/hyper-snazzy)
  - fonts: [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline)

## Installation

### 1. Install necessary packages

```bash
sudo apt-get update &&  sudo apt-get install git zsh vim tmux stow
```

### 2. Install oh-my-zsh

https://github.com/robbyrussell/oh-my-zsh

### 3. Clone this repository and create links.

```bash
cd
git clone https://github.com/juneoh/dotfiles --recursive --depth 1 --branch develop .dotfiles
cd .dotfiles
stow dotfiles
```

### 4. Install vim plugins.

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vi +PluginInstall +qall
```

### 5. Install Python packages

```bash
pip install flake8 pylint
```
