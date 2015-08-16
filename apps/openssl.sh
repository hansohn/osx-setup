#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;

# Install OpenSSL dependency
if ! brew ls | grep '^openssl$' > /dev/null 2>&1; then
  echo "==> Installing OpenSSL";
  brew install makedepend;
  brew install openssl;
fi
