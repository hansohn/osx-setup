#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/chefdk.sh;

# @TODO For now I am installing Ruby Gems in Embedded Ruby provided by ChefDK.
# I will look into transitioning to RVM in the future.

# list ruby gems to install
ruby_gems=(
  "bundler"
  "jekyll"
  "knife-acl"
  "knife-vsphere"
  "knife-windows"
  "nokogiri"
  "serverspec"
  "winrm"
);

# install ruby gems
for gem in ${ruby_gems[@]}; do
  if ! chef gem list --local | grep ${gem} > /dev/null 2>&1; then
    echo "Installing ${gem} Ruby Gem";
    chef gem install $gem;
  fi
done
