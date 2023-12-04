#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install bash
if ! brew ls | grep -e '^bash$' > /dev/null 2>&1; then
  echo "==> Installing Bash";
  brew install bash;
fi

# if shell is bash
if [[ "${SHELL##*/}" == 'bash' ]]; then
  # install bash-completions
  if ! brew ls | grep -e "^bash-completion$" > /dev/null 2>&1; then
    echo "==> Installing Bash-Completion";
    brew install bash-completion;
  fi

  # source bash_profile
  # shellcheck disable=SC1091
  if [ -f "${HOME}/.bash_profile" ]; then
    source "${HOME}/.bash_profile"
  fi
fi
