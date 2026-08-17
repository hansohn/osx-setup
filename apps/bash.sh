#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# bash comes from the Brewfile

# if shell is bash
if [[ "${SHELL##*/}" == 'bash' ]]; then
  # bash-completion comes from the Brewfile

  # source bash_profile
  # shellcheck disable=SC1091
  if [ -f "${HOME}/.bash_profile" ]; then
    source "${HOME}/.bash_profile"
  fi
fi
