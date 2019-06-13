#!/usr/bin/env bash

echo "Checking Dependencies..."
command -v brew >/dev/null 2>&1 || {
  read -p "Homebrew is not installed. Would you like to install it? (y/n) " choice
  case "$choice" in
    y|Y ) ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
    n|N ) echo "skipping";;
    * ) echo "invalid";;
  esac
}

command -v git >/dev/null 2>&1 || {
  read -p "Git is not installed. Would you like to install it? (y/n) " choice
  case "$choice" in
    y|Y ) brew install git;;
    n|N ) echo "skipping";;
    * ) echo "invalid";;
  esac
}

command -v tag >/dev/null 2>&1 || {
  read -p "Tag is not installed. Would you like to install it? (y/n) " choice
  case "$choice" in
    y|Y ) brew install tag;;
    n|N ) echo "skipping";;
    * ) echo "invalid";;
  esac
}

echo "Copying script to /usr/local/bin"
sudo cp tgd /usr/local/bin/tgd

command -v bash >/dev/null 2>&1 && {
  read -p "Create alias for bash? (y/n) " choice
  case "$choice" in
    y|Y ) echo "alias git='tgd'" >> $HOME/.bash_profile;;
    n|N ) echo "skipping";;
    * ) echo "invalid";;
  esac
}
command -v zsh >/dev/null 2>&1 && {
  read -p "Create alias for zsh? (y/n) " choice
  case "$choice" in
    y|Y ) echo "alias git='tgd'" >> $HOME/.zshrc;;
    n|N ) echo "skipping";;
    * ) echo "invalid";;
  esac
}
