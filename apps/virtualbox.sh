#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install virtualbox
if ! brew cask ls | grep "^virtualbox$" > /dev/null 2>&1; then
  echo "==> Installing VirtualBox"
  brew cask install virtualbox;
fi
