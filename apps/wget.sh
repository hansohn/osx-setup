#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;
source ./openssl.sh;

# install wget
if ! brew ls | grep '^wget$' > /dev/null 2>&1; then
  echo "==> Installing Wget";
  brew install wget;
fi
