#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install java
if ! brew ls --cask | grep -qE "^zulu(@[0-9]+)?$"; then
  echo "==> Installing Java";
  if [ -n "${JAVA_VERSION}" ]; then
    brew install --cask "java${JAVA_VERSION}";
  else
    brew install --cask java;
  fi
fi
