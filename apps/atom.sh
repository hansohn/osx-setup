#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites 
source ./homebrew.sh;

# install atom text editor
if ! which atom > /dev/null 2>&1; then
  echo "==> Installing Atom";
  brew cask install Atom;
fi
