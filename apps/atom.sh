#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites 
source ${SCRIPTPATH}/homebrew.sh;

# list atom packages to be installed
apm_packages=(
  "atom-jinja2"
  "autocomplete-python"
  "compare-files"
  "file-icons"
  "language-batch"
  "language-powershell"
  "pretty-json"
  "sort-lines"
);

# install atom text editor
if ! which atom > /dev/null 2>&1; then
  echo "==> Installing Atom";
  brew cask install atom;
fi

# install atom packages
for package in ${apm_packages[@]}; do
  if ! apm list | grep -i -q "${package}"; then
    echo "==> Installing atom package: ${package}";
    apm --color install ${package};
  fi
done
