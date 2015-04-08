#!/usr/bin/env bash

# ask for sudo upfront
sudo -v;

# load config file
source ./_config

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
for a in ${apps[@]}; do
  source ./${a};
done
