#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

# install solarized.clr color palette
if [ ! -f "${HOME}/Library/Colors/solarized.clr" ] ; then
  echo "==> Instaling solarized color palette";
  curl -fsSL https://raw.githubusercontent.com/altercation/solarized/master/apple-colorpalette-solarized/solarized.clr -o "${HOME}/Library/Colors/solarized.clr";
fi

# install solarized osx terminal profiles
if ! defaults read "${HOME}/Library/Preferences/com.apple.Terminal.plist" | grep -qE "(solarized-light|solarized-dark)"; then
  # install solarized-dark osx terminal color profile
  if [ ! -f /tmp/solarized-dark.terminal ] ; then
    echo "==> Instaling solarized-dark osx terminal profile";
    curl -fsSL https://raw.githubusercontent.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized%20Dark.terminal -o /tmp/solarized-dark.terminal;
    open --background -a Terminal /tmp/solarized-dark.terminal;
  fi

  # install solarized-light osx terminal color profile
  if [ ! -f /tmp/solarized-light.terminal ] ; then
    echo "==> Instaling solarized-light osx terminal profile";
    curl -fsSL https://raw.githubusercontent.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized%20Light.terminal -o /tmp/solarized-light.terminal;
    open --background -a Terminal /tmp/solarized-light.terminal;
  fi
fi

# set terminal colorscheme
colorscheme="solarized-dark"
if [[ $(defaults read "${HOME}/Library/Preferences/com.apple.Terminal.plist" "Default Window Settings" 2>/dev/null) != "${colorscheme}" ]] ; then
  echo "==> Setting ${colorscheme} as default color profile in osx terminal";
  defaults write "${HOME}/Library/Preferences/com.apple.Terminal.plist" "Default Window Settings" "${colorscheme}";
  defaults write "${HOME}/Library/Preferences/com.apple.Terminal.plist" "Startup Window Settings" "${colorscheme}";
fi
