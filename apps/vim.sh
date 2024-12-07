#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install vim
if ! brew ls macvim > /dev/null 2>&1; then
  echo "==> Installing MacVim";
  brew install macvim;
fi

# install vim-plug
[ -d "${HOME}/.vim/autoload" ] || mkdir -p "${HOME}/.vim/autoload"
curl -fsSL 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -o "${HOME}/.vim/autoload/plug.vim"
