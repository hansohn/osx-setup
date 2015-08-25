#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/_config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/wget.sh;

# Install iTerm2
if ! brew cask ls | grep "^iterm2$" > /dev/null 2>&1; then
  echo "==> Installing iTerm2";
  brew cask install iterm2;
  iterm_install=true;
  echo "==> Installing iTerm2 Shell Integration";
  curl -L iterm2.com/misc/install_shell_integration.sh | bash;
fi

# Install Solarized iTerm2 Colors
if brew cask ls | grep '^iterm2$' > /dev/null 2>&1; then
  # @TODO Need to find a better way of determining if Solarized Colors are 
  # installed. Setting flag during install for now.
  if "$iterm_install" = true; then
    echo "==> Installing iTerm2 Solarized Color Dark";
    wget -O /tmp/solarized_dark.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors;
    open --background /tmp/solarized_dark.itermcolors;
    echo "==> Installing iTerm2 Solarized Color Light";
    wget -O /tmp/solarized_light.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors;
    open --background /tmp/solarized_light.itermcolors;
  fi
fi
