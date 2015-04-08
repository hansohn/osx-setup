#!/usr/bin/env bash

source ./_config;
source ./homebrew;

# install virtualbox
if ! brew cask ls | grep "^virtualbox$" > /dev/null 2>&1; then
  echo "==> Installing VirtualBox"
  sudo brew cask install virtualbox;
fi
