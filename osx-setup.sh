#!/usr/bin/env bash

# scripts
as=(
  "dotfiles/dotfiles.sh"
  "apps/install.sh"
);

# execute
for s in ${as[@]}; do
  source $s;
done  
