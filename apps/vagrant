#!/usr/bin/env bash

source ./_config;
source ./homebrew;

# install the followng vagrant pieces
vagrant_apps=(
  "vagrant"
  "vagrant-manager"
);

vagrant_plugins=(
  "vagrant-berkshelf"
  "vagrant-omnibus"
  "vagrant-winrm"
);

vagrant_boxes=(
  "opscode-centos-6.5"
  "opscode-centos-6.6"
);

# install vagrant apps
for a in ${vagrant_apps[@]}; do
  if ! brew cask ls | grep "^${a}$" > /dev/null 2>&1; then
    echo "==> Installing ${a}";
    brew cask install ${a};
  fi
done

# install vagrant plugins
for p in ${vagrant_plugins[@]}; do
  if ! vagrant plugin list | grep "^${p}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${p}";
    vagrant plugin install ${p};
  fi
done

# install vagrant boxes
for b in ${vagrant_boxes[@]}; do
  if ! vagrant box list | grep "^${b}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${b} vagrant box";
    vagrant box add --name ${b} https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/${b}-provisionerless.box;
  fi
done
