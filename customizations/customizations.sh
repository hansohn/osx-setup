#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# scripts
scripts=(
  "system-settings.sh"
  "user-settings.sh"
)

# execute selected customizations
for script in ${scripts[@]}; do
  source $SCRIPTPATH/$script;
done
