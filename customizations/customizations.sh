#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# list customizations to install
customs=(
  "system-settings"
  "user-settings"
)

# execute selected customizations
for custom in ${customs[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/${custom}.sh;
done
