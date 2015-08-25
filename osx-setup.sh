#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# list scripts to be executed
scripts=(
  "dotfiles/dotfiles.sh"
  "apps/install.sh"
  "customizations/customizations.sh"
);

# execute scripts
for script in ${scripts[@]}; do
  source ${SCRIPTPATH}/$script;
done
