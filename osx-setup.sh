#!/usr/bin/env bash

# list scripts to be executed
scripts=(
  "dotfiles/dotfiles.sh"
  "apps/install.sh"
  "customizations/customizations.sh"
);

# execute scripts
for script in ${scripts[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/$script;
done
