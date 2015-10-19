#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# list vagrant plugins to be installed
vagrant_plugins=(
  "vagrant-berkshelf"
  "vagrant-omnibus"
  "vagrant-winrm"
);

# list vagrant boxes to be installed
vagrant_boxes=(
  "opscode_centos-6.5"
  "opscode_centos-6.6"
);

# install vagrant
if ! brew cask ls | grep "^vagrant$" > /dev/null 2>&1; then
  echo "==> Installing vagrant";
  brew cask install vagrant;
fi

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
    vagrant box add --name ${box} https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/${box}_chef-provisionerless.box;
  fi
done

# install vagrant-completion
if brew tap | grep -i -q "homebrew/completions" && ! brew ls | grep -i -q "vagrant-completion"; then
  echo "==> Installing vagrant-completion";
  brew install vagrant-completion;
fi
