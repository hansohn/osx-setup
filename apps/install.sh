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
  "nodejs"
)

# list cask apps for basic install
basic_brew_install=(
  "awscli"
  "csshx"
  "htop-osx"
)

# list cask apps for basic install
basic_cask_install=(
  "adobe-reader"
  "appcleaner"
  "box-sync"
  "dropbox"
  "flash"
  "flux"
  "google-chrome"
  "google-drive"
  "hyperdock"
  "lastpass"
  "java"
  "transmission"
)

# install selected custom apps
for app in ${custom_install[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/${app}.sh;
done

# install selected brew apps
for brew in ${basic_brew_install[@]}; do
  if ! brew ls | grep "^${brew}$" > /dev/null 2>&1; then
    brew install ${brew};
  fi
done

# install selected cask apps
for cask in ${basic_cask_install[@]}; do
  if ! brew cask ls | grep "^${cask}$" > /dev/null 2>&1; then
    brew cask install ${cask};
  fi
done
