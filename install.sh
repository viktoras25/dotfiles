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

echo 'Install vim plugin bundle'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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

function copyClaudeFile {
  if [ ! -f "claude/$1" ]; then
    echo "File does not exist: claude/$1";
    return 1;
  fi;

  echo "Install claude/$1"
  mkdir -p ~/.claude

  if [ -f ~/.claude/"$1" ] && ! (cmp -s "claude/$1" ~/.claude/"$1"); then
    cp ~/.claude/"$1" ~/.claude/"$1".backup;
    echo "Created a backup: ~/.claude/$1.backup";
  fi;

  cp "claude/$1" ~/.claude/"$1";
}

copyClaudeFile 'settings.json';
copyClaudeFile 'statusline-command.sh';
chmod +x ~/.claude/statusline-command.sh;

if [ ! -f ~/CLAUDE.md ]; then
  cp claude/CLAUDE.md ~/CLAUDE.md;
fi

unset copyFile;
unset copyClaudeFile;
