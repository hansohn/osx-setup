#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install python2
if ! brew ls | grep "^python@2$" > /dev/null 2>&1; then
  echo "==> Installing Python2";
  brew install python;
  python2 -m pip install --upgrade pip setuptools wheel;
fi

# install python3
if ! brew ls | grep "^python$" > /dev/null 2>&1; then
  echo "==> Installing Python3";
  brew install python3;
  python3 -m pip install --upgrade pip setuptools wheel;
fi
