#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;

# list vagrant apps to be installed
vagrant_apps=(
  "vagrant"
  "vagrant-manager"
);

# list vagrant plugins to be installed
vagrant_plugins=(
  "vagrant-berkshelf"
  "vagrant-omnibus"
  "vagrant-winrm"
);

# list vagrant boxes to be installed
vagrant_boxes=(
  "opscode-centos-6.5"
  "opscode-centos-6.6"
);

# install vagrant apps
for apps in ${vagrant_apps[@]}; do
  if ! brew cask ls | grep "^${apps}$" > /dev/null 2>&1; then
    echo "==> Installing ${apps}";
    brew cask install ${apps};
  fi
done

# install vagrant plugins
for plugin in ${vagrant_plugins[@]}; do
  if ! vagrant plugin list | grep "^${plugin}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${plugin}";
    vagrant plugin install ${plugin};
  fi
done

# install vagrant boxes
for box in ${vagrant_boxes[@]}; do
  if ! vagrant box list | grep "^${box}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${box} vagrant box";
    vagrant box add --name ${box} https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/${box}-provisionerless.box;
  fi
done
