#!/usr/bin/env bash

source ./_config;
source ./homebrew;
source ./chefdk;

# @TODO For now I am installing Ruby Gems in Embedded Ruby provided by ChefDK.
# I will look into transitioning to RVM in the future.

# list ruby gems to install
ruby_gems=(
  "serverspec"
  "nokogiri"
);

# install ruby gems
for g in ${ruby_gems[@]}; do
  if ! gem list --local | grep ${g} > /dev/null 2>&1; then
    echo "Installing ${g} Ruby Gem";
    gem install $g;
  fi
done
