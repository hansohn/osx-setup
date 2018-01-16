#!/usr/bin/env bash

# list scripts to be executed
scripts=(
  "dotfiles/dotfiles.sh"
  "customizations/customizations.sh"
  "apps/install.sh"
);

# execute scripts
for script in ${scripts[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/$script;
done
