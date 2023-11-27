#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/openssl.sh;

# install wget
if ! brew ls | grep -qe '^wget$'; then
  echo "==> Installing Wget";
  brew install wget;
fi
