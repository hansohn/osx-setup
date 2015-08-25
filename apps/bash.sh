#!/usr/bin/env bash

<<<<<<< HEAD
# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;

# install bash
if ! brew ls | grep '^bash$' > /dev/null 2>&1; then
  echo "==> Installing Bash";
  brew install bash;
=======
# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/_config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;

# install bash
if ! brew ls | grep -i -q "bash"; then
  echo "==> Installing Bash";
  brew install bash;
fi

# install bash-completions
if ! brew ls | grep -i -q "bash-completion"; then
  echo "==> Installing Bash-Completion";
>>>>>>> develop
  brew install bash-completion;
fi

# source bash_profile
if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi
