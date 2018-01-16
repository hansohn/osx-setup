#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/java.sh;

# install hadoop
if ! brew ls | grep "^hadoob$" > /dev/null 2>&1; then
  echo "==> Installing Hadoop";
  brew install hadoop;
fi
