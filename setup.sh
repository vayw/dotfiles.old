#!/usr/bin/env bash

set -e

function get_path()
{
    if [ "$(dirname ${BASH_SOURCE[0]})" == '.' ]; then
        DOTFILES=$(pwd)
    else
        DOTFILES=$(pwd)/$(dirname "${BASH_SOURCE[0]}")
    fi
    # Remove all /./ sequences.
    local   path=${DOTFILES//\/.\//\/}
    # Remove dir/.. sequences.
    while [[ $path =~ ([^/][^/]*/\.\./) ]]
    do
        path=${path/${BASH_REMATCH[0]}/}
    done
    DOTFILES=$path
}

if [ "$(uname)" == "Darwin" ]; then
  ln_opts="-sFh"
else
  ln_opts="-sn"
fi

echo "Setting up environment.."
get_path
echo -e "\ndotfiles dir is $DOTFILES"

echo -e "\nsetting up bashrc"
ln $ln_opts $DOTFILES/bashrc ~/.bashrc
ln $ln_opts $DOTFILES/bash.d ~/.bash.d

echo -e "\nSetting up VIM"
ln $ln_opts $DOTFILES/vim ~/.vim
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -e "\nSetting up Tmux"
ln $ln_opts $DOTFILES/tmux.conf ~/.tmux.conf
