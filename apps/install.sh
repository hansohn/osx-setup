#!/usr/bin/env bash

# load config file
source `dirname "${BASH_SOURCE[0]}"`/../config.sh

# list apps to install
apps=(
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
)

# install selected apps
for app in ${apps[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/${app}.sh;
done
