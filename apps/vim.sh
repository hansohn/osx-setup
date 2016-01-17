#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install vim
if ! brew ls | grep '^vim$' > /dev/null 2>&1; then
  echo "==> Installing Vim";
  brew install vim;
fi

# install vindle
if which vim > /dev/null 2>&1; then
  if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "==> Installing Vundle";
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
    if [ -f ~/.vimrc ]; then
      vim +PluginInstall '+source ~/.vimrc' +qall;
    fi
  fi
fi

# install powerline fonts
if [ ! -d ~/.vim/fonts ]; then
  echo "==> Installing Powerline Fonts";
  git clone https://github.com/powerline/fonts.git ~/.vim/fonts
  source ~/.vim/fonts/install.sh
fi
