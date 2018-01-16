#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install python2
if ! brew ls | grep "^python$" > /dev/null 2>&1; then
  echo "==> Installing Python2";
  brew install python;
  pip2 install --upgrade pip setuptools;
fi

# install python3
if ! brew ls | grep "^python3$" > /dev/null 2>&1; then
  echo "==> Installing Python3";
  brew install python3;
  pip3 install --upgrade pip setuptools;
fi
