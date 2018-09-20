#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/openssl.sh;

# brew tap chefdk
if ! brew tap | grep -i -q "chef/chef"; then
  echo "==> Installing Chef Brew Taps";
  brew tap 'chef/chef'
fi

# install chefdk
if ! brew cask ls | grep "^chefdk$" > /dev/null 2>&1; then
  echo "==> Installing Chef Development Kit";
  brew cask install 'chef/chef/chefdk';
  echo "==> Update PATH with embedded Chef appliations";
  eval "$(chef shell-init bash)";
  echo "==> Configure Knife SSL";
  mkdir -p ~/.chef
  openssl genrsa 2048 > ~/.chef/${USER}-local.pem;
  knife configure --defaults --key "`echo ~`/.chef/${USER}-local.pem" --repository "";
fi

# install kitchen-completion
if ! brew ls | grep -i -q "kitchen-completion"; then
  echo "==> Installing kitchen-completion";
  brew install kitchen-completion;
fi
