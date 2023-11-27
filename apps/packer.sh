#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";
source "${SCRIPTPATH}/wget.sh";


# Install Packer
if ! brew ls | grep -qe '^packer$'; then
    echo "==> Installing Packer";
    brew install packer;
fi

# install packer-completions
if [[ "${SHELL##*/}" == 'bash' ]] && ! brew ls | grep -qe '^packer-completion$'; then
  echo "==> Installing packer-completion";
  brew install packer-completion;
fi
