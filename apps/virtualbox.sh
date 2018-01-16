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
  echo "==> Installing VirtualBox Extension Pack"
  brew cask install virtualbox-extension-pack;
fi
