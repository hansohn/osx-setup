#!/usr/bin/env bash

# Gather config variables
source ./_config;
source ./homebrew;

# Install OpenSSL dependency
if ! brew ls | grep '^openssl$' > /dev/null 2>&1; then
  echo "==> Installing OpenSSL";
  brew install makedepend;
  brew install openssl;
fi
