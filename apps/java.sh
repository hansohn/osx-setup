#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install java
if ! brew cask ls | grep "^java$" > /dev/null 2>&1; then
  echo "==> Installing Java";
  brew cask install java;
fi
