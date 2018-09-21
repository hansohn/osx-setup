#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install homebrew
if ! which brew > /dev/null 2>&1; then
  if [[ `xcode-select --version` ]] && [[ `which ruby` ]]; then
    echo "==> Instaling HomeBrew";
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null;
    echo "==> Updating HomeBrew";
    brew update && brew cleanup;
    echo "==> Inspecting HomeBrew for configuration issues";
    brew doctor;
  else
    echo "==> Error: You need 'XCode Tools' to continue, please run 'xcode-select --install'";
    exit 1;
  fi
fi

# install taps
if which brew > /dev/null 2>&1; then
  if ! brew tap | grep -i -q "homebrew/cask" ; then
    echo "==> Installing homebrew/cask tap";
    brew tap homebrew/cask;
    echo "==> Installing homebrew/cask-versions tap";
    brew tap homebrew/cask-versions
  fi
fi
