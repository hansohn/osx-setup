#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install docker
if ! brew ls | grep -qe '^docker$'; then
  echo "==> Installing Docker";
  brew install --cask docker;
fi

# install docker-completion
if [[ "${SHELL##*/}" == 'bash' ]] && ! brew ls | grep -qe '^docker-completion$'; then
  echo "==> Install Docker-Completion";
  brew install docker-completion;
fi
