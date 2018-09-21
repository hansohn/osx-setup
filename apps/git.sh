#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/openssl.sh;

# install git
if ! brew ls | grep "^git$" > /dev/null 2>&1; then
  echo "==> Installing Git";
  brew install git --with-openssl;
fi

# install git-flow
if ! brew ls | grep "^git-flow$" > /dev/null 2>&1; then
  echo "==> Installing Git-Flow";
  brew install git-flow;
fi

# setup gitconfig
if [ ! -f ~/.gitconfig ] > /dev/null 2>&1; then
  echo "==> Configuring Git"
  git config --global user.name "$GIT_USER_NAME";
  git config --global user.email "$GIT_USER_EMAIL";
  git config --global core.editor vim;
  git config --global credential.helper osxkeychain;
fi
