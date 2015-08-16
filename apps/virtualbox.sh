#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;

# install virtualbox
if ! brew cask ls | grep "^virtualbox$" > /dev/null 2>&1; then
  echo "==> Installing VirtualBox"
  sudo brew cask install virtualbox;
fi
