#!/usr/bin/env bash

# Gather config variables
source ./_config;
source ./homebrew;
source ./openssl;

# Install WGET
if ! brew ls | grep '^wget$' > /dev/null 2>&1; then
  echo "==> Installing Wget";
  brew install wget;
fi
