#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

fonts=(
  'font-hack-nerd-font'
)

# homebrew/cask-fonts was deprecated and folded into homebrew/cask, so no
# tap is needed -- tapping it now errors with "this tap is now empty"

# install fonts
for font in "${fonts[@]}"; do
  if ! brew ls --cask "${font}" > /dev/null 2>&1; then
    echo "==> Installing ${font}";
    brew install --cask "${font}";
  fi
done
