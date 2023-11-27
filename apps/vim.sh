#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install vim
if ! brew ls | grep -qe '^vim$'; then
  echo "==> Installing Vim";
  brew install vim;
fi

# install vindle
if which vim > /dev/null 2>&1; then
  if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
    echo "==> Installing Vundle";
    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim";
    if [ -f "${HOME}/.vimrc" ]; then
      vim +PluginInstall "+source ${HOME}/.vimrc" +qall;
    fi
  fi
fi

# install powerline fonts
# shellcheck disable=SC1091
if [ ! -d "${HOME}/.vim/fonts" ]; then
  echo "==> Installing Powerline Fonts";
  git clone https://github.com/powerline/fonts.git "${HOME}/.vim/fonts";
  chmod 755 "${HOME}/.vim/fonts/install.sh";
  source "${HOME}/.vim/fonts/install.sh";
fi

# compile YouCompleteMe
if ! brew ls | grep -qe '^cmake$'; then
  echo "==> Installing CMake";
  brew install cmake;
fi

if [ -d "${HOME}/.vim/bundle/YouCompleteMe" ]; then
  echo "==> Compiling YouCompleteMe";
  pushd "${HOME}/.vim/bundle/YouCompleteMe" || exit;
  ./install.py --clang-completer --go-completer --js-completer;
  popd || return;
fi
