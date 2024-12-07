#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# Install iTerm2
if ! brew ls iterm2 > /dev/null 2>&1; then
  echo "==> Installing iTerm2";
  brew install --cask iterm2;

  echo "==> Installing iTerm2 Shell Integration";
  curl -L iterm2.com/misc/install_shell_integration.sh | bash;

  echo "==> Installing iTerm2 Solarized Color Dark";
  curl -fsSL https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors -o /tmp/solarized_dark.itermcolors;
  open --background -a /Applications/iTerm.app /tmp/solarized_dark.itermcolors;

  echo "==> Installing iTerm2 Solarized Color Light";
  curl -fsSL https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors -o /tmp/solarized_light.itermcolors;
  open --background -a /Applications/iTerm.app /tmp/solarized_light.itermcolors;
fi
