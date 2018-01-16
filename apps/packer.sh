#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/wget.sh;


# Install Packer
if ! brew ls | grep "^packer$" > /dev/null 2>&1; then
    echo "==> Installing Packer";
    brew install packer;
fi

# install packer-completions
if ! brew ls | grep -i -q "packer-completion"; then
  echo "==> Installing packer-completion";
  brew install packer-completion;
fi
