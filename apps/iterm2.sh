#!/usr/bin/env bash

# import config vars
source ./_config.sh;

# install prerequisites
source ./homebrew.sh;
source ./wget.sh;

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
    open /tmp/solarized_dark.itermcolors;
    echo "==> Installing iTerm2 Solarized Color Light";
    wget -O /tmp/solarized_light.itermcolors https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors;
    open /tmp/solarized_light.itermcolors;
  fi
fi
