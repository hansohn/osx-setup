#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install virtualbox
if ! brew ls | grep "^virtualbox$" > /dev/null 2>&1; then
  echo "==> Installing VirtualBox"
  brew install --cask virtualbox;
  echo "==> Installing VirtualBox Extension Pack"
  brew install --cask virtualbox-extension-pack;
fi
