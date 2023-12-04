#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install docker
if ! brew ls | grep -e '^docker$' > /dev/null 2>&1; then
  echo "==> Installing Docker";
  brew install --cask docker;
fi

# install docker-completion
if [[ "${SHELL##*/}" == 'bash' ]] && ! brew ls | grep -e '^docker-completion$' > /dev/null 2>&1; then
  echo "==> Install Docker-Completion";
  brew install docker-completion;
fi
