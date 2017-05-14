# home

Personal environment settings for Ubuntu.

- terminal multiplexer: tmux
  - color scheme: custom adaptation of hyper-snazzy
- shell: zsh
  - plugin manager: [oh-my-zsh](http://ohmyz.sh/)
  - prompt: [pure](https://github.com/sindresorhus/pure)
- editor: VIM
  - plugin manager: [Vundle](https://github.com/VundleVim/Vundle.vim)
  - plugins: refer to `.vimrc` file.
- recommended
  - color scheme: [hyper-snazzy](https://github.com/sindresorhus/hyper-snazzy)
  - fonts: [Menlo for Powerline](https://github.com/abertsch/Menlo-for-Powerline)

## Requirements

#### 1. Install `tmux`, `vi`, `git`, `zsh`, and `oh-my-zsh`  

```
sudo apt-get update
sudo apt-get install tmux vi git zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### 2. Install Vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Installation

### 1. Prepare home directory

The settings in `.config/user-dirs.dirs` file will require the following modifications
to the home directory:

- Changing the user directory names to lowercase
- Merging `Music` and `Video` directory to `media`

If you wish not to make such change, keep an original copy of your `user-dirs.dirs` file
and revert back after installing the settings in this repository.

### 2. Pull this repository to home directory, with submodules

**WARNING:** The following script will overwrite your home directory with the files of
this repository. Make sure to keep backups to your previous settings if necessary.

```
cd
git init
git commit -m --allow-empty "Initial commit"
git remote add origin https://github.com/juneoh/home
git pull origin master
git reset --hard origin/master
cd .zsh-pure
git submodule init
git submodule update
```

### 4. Install Vundle plugins

Open `vi` and run `:PluginInstall`.

### 5. Change default user login shell to zsh

```
chsh -s `which zsh`
```
