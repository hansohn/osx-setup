#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# Install AWS CLI
if ! brew cask ls | grep "^awscli$" > /dev/null 2>&1; then
  echo "==> Installing AWS CLI";
  brew cask install awscli;
fi
