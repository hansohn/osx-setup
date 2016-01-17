#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# install prerequisites
source ${SCRIPTPATH}/homebrew.sh;
source ${SCRIPTPATH}/wget.sh;

# Install iTerm2
if ! brew cask ls | grep "^iterm2$" > /dev/null 2>&1; then
  echo "==> Installing iTerm2";
  brew cask install iterm2;
  echo "==> Installing iTerm2 Shell Integration";
  curl -L iterm2.com/misc/install_shell_integration.sh | bash;
  echo "==> Installing iTerm2 Solarized Color Dark";
  wget -O /tmp/solarized_dark.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors;
  open --background -a /Applications/iTerm.app /tmp/solarized_dark.itermcolors;
  echo "==> Installing iTerm2 Solarized Color Light";
  wget -O /tmp/solarized_light.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors;
  open --background -a /Applications/iTerm.app /tmp/solarized_light.itermcolors;
fi
