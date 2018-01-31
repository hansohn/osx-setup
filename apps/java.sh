#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install java
if ! brew cask ls | grep -E "^java([1-9]{1})?$" > /dev/null 2>&1; then
  echo "==> Installing Java";
  if [ -n ${JAVA_VERSION} ]; then
    brew cask install java${JAVA_VERSION};
  else
    brew cask install java;
  fi
fi
