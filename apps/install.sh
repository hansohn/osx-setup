#!/usr/bin/env bash

# load config file
source `dirname "${BASH_SOURCE[0]}"`/../config.sh

# list apps for customized install
custom_install=(
  "homebrew"
  "openssl"
  "wget"
  "vim"
  "git"
  "virtualbox"
  "chefdk"
  "ruby"
  "vagrant"
  "packer"
  "iterm2"
  "atom"
  "bash"
  "osx-terminal"
  "python"
  "aws"
  "firefox"
)

# install selected apps
for app in ${custom_install[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/${app}.sh;
done

# list apps for basic install
basic_install=(
  "adobe-reader"
  "appcleaner"
  "box-sync"
  "dropbox"
  "flash"
  "google-chrome"
  "google-drive"
  "hyperdock"
  "lastpass"
  "transmission"
)

# install selected apps
for app in ${basic_install[@]}; do
  if ! brew cask ls | grep "^${app}$" > /dev/null 2>&1; then
    brew cask install ${app};
  fi
done
