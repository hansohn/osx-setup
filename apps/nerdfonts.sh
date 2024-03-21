#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

nerdfonts=(
  'font-hack-nerd-font'
)

# install nerdfont tap
if ! brew tap | grep -i -q "homebrew/cask-fonts" ; then
  echo "==> Installing homebrew/cask-fonts tap";
  brew tap homebrew/cask-fonts
fi

# install nerdfonts
for font in "${nerdfonts[@]}"; do
  if ! brew ls | grep -e "^${font}$" > /dev/null 2>&1; then
    echo "==> Installing ${font}";
    brew install "${font}";
  fi
done
