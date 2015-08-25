#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/_config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/wget.sh;

# variables
PACKER_DIR="`readlink $(which packer) | sed 's/\/packer//2'`"
PACKER_WIN_PLGNS="https://github.com/packer-community/packer-windows-plugins/releases/download/v1.0.0-rc/darwin_amd64.zip"

# Install Packer
if ! brew cask ls | grep "^packer$" > /dev/null 2>&1; then
    echo "==> Installing Packer";
    sudo brew cask install packer;
fi

# Install Packer-Windows-Plugins
if brew cask ls | grep "^packer$" > /dev/null 2>&1; then
  if ! ls -Glh ${PACKER_DIR} | grep "\-windows\-" > /dev/null 2>&1; then
    echo "==> Installing Packer-Windows-Plugins"
    sudo curl -L ${PACKER_WIN_PLGNS} > /tmp/darwin_amd64.zip;
    sudo unzip -x /tmp/darwin_amd64.zip -d ${PACKER_DIR};
    sudo chown -R root:wheel ${PACKER_DIR}/*
    sudo rm -f /tmp/darwin_amd64.zip;
  fi
fi

# install packer-completions
if ! brew ls | grep -i -q "packer-completion"; then
  echo "==> Installing packer-completion";
  brew install packer-completion;
fi
