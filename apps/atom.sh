#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/_config.sh;

# install prerequisites 
source ${SCRIPTPATH}/homebrew.sh;

# install atom text editor
if ! which atom > /dev/null 2>&1; then
  echo "==> Installing Atom";
  brew cask install Atom;
fi
