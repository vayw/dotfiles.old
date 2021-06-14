#!/usr/bin/env bash

echo "Setting up environment.."
DOTFILES=$(pwd)/$(dirname "${BASH_SOURCE[0]}")
echo dotfiles dir is $DOTFILES
echo setting up bashrc
ln -sf $DOTFILES/bashrc ~/.bashrc
ln -sf $DOTFILES/bash.d ~/bash.d

echo -e "\nSetting up VIM"
ln -sf $DOTFILES/vim ~/.vim
if [ ! -x ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
