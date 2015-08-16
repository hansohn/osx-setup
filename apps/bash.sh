#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;

# install bash
if ! brew ls | grep '^bash$' > /dev/null 2>&1; then
  echo "==> Installing Bash";
  brew install bash;
  brew install bash-completion;
fi

# source bash_profile
if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi
