#!/usr/bin/env bash

# ask for sudo upfront
# sudo -v;

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# load config file
source ${SCRIPTPATH}/_config.sh

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
<<<<<<< HEAD:apps/_install.sh
  source ./${app}.sh;
=======
  source ${SCRIPTPATH}/${app}.sh;
>>>>>>> develop:apps/install.sh
done
