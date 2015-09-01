#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# start sudo grace period (default: 5 mins)
sudo -v;

# list scripts to be executed
scripts=(
  "dotfiles/dotfiles.sh"
  "apps/install.sh"
  "customizations/customizations.sh"
);

# execute scripts
for script in ${scripts[@]}; do
  # run script
  source ${SCRIPTPATH}/$script;

  # extend sudo grace period
  sudo -v;
done
