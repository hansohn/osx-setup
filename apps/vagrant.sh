#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# list vagrant plugins to be installed
vagrant_plugins=(
  "vagrant-aws"
  "vagrant-vbguest"
);

# install vagrant
if ! brew ls | grep -e '^vagrant$' > /dev/null 2>&1; then
  echo "==> Installing vagrant";
  brew install --cask vagrant;
fi

# install vagrant plugins
for plugin in "${vagrant_plugins[@]}"; do
  if ! vagrant plugin list | grep -qe "^${plugin}\s+.*$"; then
    echo "==> Installing ${plugin}";
    vagrant plugin install "${plugin}";
  fi
done

# install vagrant-completion
if [[ "${SHELL##*/}" == 'bash' ]] && ! brew ls | grep -e '^vagrant-completion$' > /dev/null 2>&1; then
  echo "==> Installing vagrant-completion";
  brew install vagrant-completion;
fi
