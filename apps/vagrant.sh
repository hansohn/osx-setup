#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")

# import config vars
source "${SCRIPTPATH}/../config.sh"


# list vagrant plugins to be installed
vagrant_plugins=()

# hashicorp-vagrant comes from the Brewfile

# install vagrant plugins
for plugin in "${vagrant_plugins[@]}"; do
  if ! vagrant plugin list | grep -qe "^${plugin}\s+.*$"; then
    echo "==> Installing ${plugin}"
    vagrant plugin install "${plugin}"
  fi
done

# NOTE: vagrant-completion was removed from homebrew-core and has no replacement
# formula, so no shell completion is installed here.
