#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;
source ./openssl.sh;

# install chefdk
if ! brew cask ls | grep "^chefdk$" > /dev/null 2>&1; then
  echo "==> Installing Chef Development Kit";
  brew cask install chefdk;
  echo "==> Update PATH with embedded Chef appliations";
  eval "$(chef shell-init bash)";
  echo "==> Configure Knife SSL";
  openssl genrsa 2048 > ~/.chef/${USER}-local.pem;
  knife configure --defaults --key "`echo ~`/.chef/${USER}-local.pem" --repository "";
fi
