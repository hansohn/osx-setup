#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install python
if ! brew cask ls | grep "^python$" > /dev/null 2>&1; then
  echo "==> Installing Python";
  brew cask install python;
  pip install --upgrade pip setuptools;
fi
