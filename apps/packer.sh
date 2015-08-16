#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;
source ./wget.sh;

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
