#!/usr/bin/env bash

set -e

if [ "$(uname)" == "Darwin" ]; then
  ln_opts="-sFh"
else
  ln_opts="-sn"
fi

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

function check_and_create_link() {
    local target="$DOTFILES/$2"
    if [[ -h $1 ]]; then
        if [[ "$(readlink $1)" == "$target" ]]; then
      	    echo $2 is already linked
        else
    	    ln $ln_opts -f $target $1
    	    echo $2 linked
        fi
    else
        if [[ -d "$1" ]]; then
            echo "$1 is dir.. moving to $HOME/$(basename $1)_backup"
            mv "$1" "$HOME/$(basename $1)_backup"
        fi
	ln $ln_opts $target $1
    	echo $2 linked
    fi
}

echo "Setting up environment.."
get_path
echo -e "\ndotfiles dir is $DOTFILES"

echo -e "\nsetting up bashrc"
check_and_create_link "$HOME/.bashrc" bashrc
check_and_create_link "$HOME/.bash.d" bash.d

echo -e "\nSetting up VIM"
check_and_create_link "$HOME/.vim" vim
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo -e "\ndownloading vim plug"
  curl -s -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo -e "\nSetting up Tmux"
check_and_create_link "$HOME/.tmux.conf" tmux.conf
