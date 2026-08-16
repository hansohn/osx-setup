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
if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then
  echo "==> Installing vim-plug";
  curl -fsSL 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -o "${HOME}/.vim/autoload/plug.vim"
fi

# fetch the plugins declared in .vim/plugins.vim -- without this the first vim
# launch errors with "E185: Cannot find color scheme 'gruvbox'" and none of
# airline, NERDTree or ALE are present
if [ -f "${HOME}/.vimrc" ] && [ -f "${HOME}/.vim/plugins.vim" ]; then
  echo "==> Installing vim plugins";
  vim -es -u "${HOME}/.vimrc" -i NONE -c "PlugInstall! --sync" -c qa > /dev/null 2>&1 || true
fi
