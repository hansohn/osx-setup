#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/wget.sh;

# Install firefox
if ! brew cask ls | grep "^firefox$" > /dev/null 2>&1; then
  echo "==> Installing Firefox";
  brew cask install firefox;
  echo "==> Installing Addons";
  # firebug
  wget -O /tmp/addon-1843-latest.xpi wget https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi;
  open --background -a /Applications/Firefox.app/Contents/MacOS/firefox /tmp/addon-1843-latest.xpi;
fi
