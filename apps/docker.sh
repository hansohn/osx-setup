#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install docker
if ! brew cask ls | grep "^docker$" > /dev/null 2>&1; then
  echo "==> Installing Docker";
  brew cask install docker;
fi

# install docker-completion
docker_bashcomps=(
  "docker-completion"
);
for docker_bashcomp in ${docker_bashcomps[@]}; do
  if [ ! -f "/usr/local/etc/bash_completion.d/${docker_bashcomp}" ]; then
    echo "==> Linking Docker Bash Completion: ${docker_bashcomp}";
    brew install docker-completion;
  fi
done
