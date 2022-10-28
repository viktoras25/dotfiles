#!/usr/bin/env bash

set -e

function copyFile {
  if [ ! -f "$1" ]; then
    echo "File does not exist!";

    return 1;
  fi;

  echo "Install $1"

  if [ -f ~/"$1" ] && ! (cmp -s "$1" ~/"$1"); then
    cp ~/"$1" ~/"$1".backup;
    echo "Created a backup: ~/$1.backup";
  fi;

  cp "$1" ~/"$1";
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
which -s brew || source ./brew/install-brew.sh;

echo "Install basic set of utils"
brew bundle --file ./brew/Base.Brewfile --no-lock;

copyFile '.alias';
copyFile '.bash_profile';
copyFile '.bashrc';
copyFile '.gitconfig';
copyFile '.tmux.conf';
copyFile '.vimrc';
copyFile '.zshrc';

# Only initially
if [ ! -f ~/.zshenv ]; then
  copyFile '.zshenv';
fi

# Git configuration
[ "$EMAIL" ] && git config --global user.email "$EMAIL"
[ "$GPG_KEY" ] && git config --global user.signingkey "$GPG_KEY"
git config --global gpg.program "$(which gpg)"

# Install vim plugins
vim +PluginInstall +qall

# Install Oh-my-zsh
echo "Install oh-my-zsh"
if [ ! "$ZSH" ]; then
  sh ./zsh/install-omz.sh --unattended --keep-zshrc;
fi;

unset copyFile;
