#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install bash
if ! brew ls | grep -qe '^bash$'; then
  echo "==> Installing Bash";
  brew install bash;
fi

# if shell is bash
if [[ "${SHELL##*/}" == 'bash' ]]; then
  # install bash-completions
  if ! brew ls | grep -qe "^bash-completion$"; then
    echo "==> Installing Bash-Completion";
    brew install bash-completion;
  fi

  # source bash_profile
  if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
  fi
fi
