#!/usr/bin/env bash

# ask for sudo upfront
sudo -v;

# load config file
source ./_config.sh

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
)

# install selected apps
for app in ${apps[@]}; do
  source ./${app}.sh;
done
