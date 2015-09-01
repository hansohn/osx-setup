#!/usr/bin/env bash

# load config file
source `dirname "${BASH_SOURCE[0]}"`/_config.sh

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
)

# install selected apps
for app in ${apps[@]}; do
  # install app
  source `dirname "${BASH_SOURCE[0]}"`/${app}.sh;

  # reinitialize sudo grace period
  sudo -v;
done
