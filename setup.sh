#!/usr/bin/env bash

echo "Setting up environment.."
DOTFILES=$(pwd)/$(dirname "${BASH_SOURCE[0]}")
echo dotfiles dir is $DOTFILES
echo setting up bashrc
ln -sf $DOTFILES/bashrc ~/.bashrc
ln -sf $DOTFILES/bash.d ~/bash.d
