#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;
source ./chefdk.sh;

# @TODO For now I am installing Ruby Gems in Embedded Ruby provided by ChefDK.
# I will look into transitioning to RVM in the future.

# list ruby gems to install
ruby_gems=(
  "serverspec"
  "nokogiri"
);

# install ruby gems
for gem in ${ruby_gems[@]}; do
  if ! gem list --local | grep ${gem} > /dev/null 2>&1; then
    echo "Installing ${gem} Ruby Gem";
    gem install $gem;
  fi
done
