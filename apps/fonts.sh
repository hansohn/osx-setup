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

# install fonts tap
if ! brew tap | grep -i -q "homebrew/cask-fonts" ; then
  echo "==> Installing homebrew/cask-fonts tap";
  brew tap homebrew/cask-fonts
fi

# install fonts
for font in "${fonts[@]}"; do
  if ! brew ls "^${font}$" > /dev/null 2>&1; then
    echo "==> Installing ${font}";
    brew install --cask "${font}";
  fi
done
