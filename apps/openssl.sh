#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# Install OpenSSL dependency
if ! brew ls | grep -qe '^openssl$'; then
  echo "==> Installing OpenSSL";
  brew install openssl;
fi
