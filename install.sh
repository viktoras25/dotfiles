#!/usr/bin/env bash

set -e

function copyFile {
  if [ ! -f "$1" ]; then
    echo "File does not exist!"

    return 1
  fi

  echo "Install $1"

  if [ -f ~/"$1" ] && ! (cmp -s "$1" ~/"$1"); then
    cp ~/"$1" ~/"$1".backup
    echo "Created a backup: ~/$1.backup"
  fi

  cp "$1" ~/"$1"
}

echo " "
echo " ██████████             █████       ██████   ███  ████                  "
echo " ░███░░░░███           ░░███       ███░░███ ░░░  ░░███                  "
echo " ░███   ░░███  ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████ "
echo " ░███    ░███ ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░  "
echo " ░███    ░███░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████ "
echo " ░███    ███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███"
echo " ██████████  ░░██████   ░░█████   █████     █████ █████░░██████  ██████ "
echo "░░░░░░░░░░    ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░  "
echo " "

xcode-select --install || echo "xcode-select already installed"

echo "Check if brew is installed"
which -s brew || source ./brew/install-brew.sh

echo "Install basic set of utils"
brew bundle --file ./brew/Brewfile --no-lock

copyFile '.bash_profile'
copyFile '.bashrc'
copyFile '.gitconfig'
copyFile '.tmux.conf'
copyFile '.vimrc'
copyFile '.zshrc'
touch ~/.zshrc.local

# Install vim plugins
vim +PluginInstall +qall

# Install Oh-my-zsh
echo "Install oh-my-zsh"
sh ./zsh/install-omz.sh --unattended --keep-zshrc
