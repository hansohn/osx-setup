#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/python.sh;

# list global npms to be installed
npms=(
  'npm'
  'express'
  'express-generator'
  'pm2'
);

# install nvm
if ! brew ls | grep -qe '^nvm$'; then
  echo "==> Installing nvm";
  brew install nvm;
  mkdir ~/.nvm;
  export NVM_DIR="${HOME}/.nvm";
  source "$(brew --prefix nvm)/nvm.sh";
fi

# install node
if nvm --version > /dev/null 2>&1; then
  export NVM_DIR="${HOME}/.nvm";
  source "$(brew --prefix nvm)/nvm.sh";
  if ! which node > /dev/null 2>&1; then
    echo "==> Installing nodejs";
    if [ -n ${NODE_VERSION} ]; then
      nvm install ${NODE_VERSION};
      nvm use v${NODE_VERSION};
    else
      nvm install stable;
      nvm use default;
    fi
  fi
fi

# install global npms
for npm in ${npms[@]}; do
  if ! npm list -g | grep "\s${npm}@" > /dev/null 2>&1; then
    echo "==> Installing ${npm}";
    export NVM_DIR="${HOME}/.nvm";
    source "$(brew --prefix nvm)/nvm.sh";
    npm install -g ${npm};
  fi
done
