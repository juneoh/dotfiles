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

## Installation

### 1. Prepare home directory

The settings in `.config/user-dirs.dirs` file will require the following modifications
to the home directory:

- Changing the user directory names to lowercase
- Merging `Music` and `Video` directory to `media`

If you wish not to make such change, keep an original copy of your `user-dirs.dirs` file
and revert back after installing the settings in this repository.

### 2. Run the install script

**WARNING:** The following script will overwrite your home directory with the files of
this repository. Make sure to keep backups to your previous settings if necessary.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/juneoh/dotfiles/install/install.sh)"
```

