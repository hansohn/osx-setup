#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install python2
if ! brew cask ls | grep "^python$" > /dev/null 2>&1; then
  echo "==> Installing Python2";
  brew cask install python;
  pip2 install --upgrade pip setuptools;
fi

# install python3
if ! brew cask ls | grep "^python3$" > /dev/null 2>&1; then
  echo "==> Installing Python3";
  brew cask install python3;
  pip3 install --upgrade pip setuptools;
fi
