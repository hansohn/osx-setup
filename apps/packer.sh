#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";


# Install Packer
if ! brew ls packer > /dev/null 2>&1; then
    echo "==> Installing Packer";
    brew install packer;
fi

# NOTE: packer-completion was removed from homebrew-core and has no replacement
# formula, so no shell completion is installed here.
