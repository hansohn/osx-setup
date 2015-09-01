#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/_config.sh;

# install solarized.clr color palette
if ! -f ~/Library/Colors/solarized.clr; then
  wget -O ~/Library/Colors/solarized.clr https://raw.githubusercontent.com/altercation/solarized/master/apple-colorpalette-solarized/solarized.clr;
fi

# install solarized osx terminal profiles
if ! defaults read ~/Library/Preferences/com.apple.Terminal.plist | grep -q -E "(solarized-light|solarized-dark)"; then
  # install solarized-dark osx terminal color profile
  if ! -f /tmp/solarized-dark.terminal ; then
    wget -O /tmp/solarized-dark.terminal https://raw.githubusercontent.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized%20Dark.terminal;
    open --background -a Terminal /tmp/solarized-dark.terminal;
  fi

  # install solarized-light osx terminal color profile
  if ! -f /tmp/solarized-light.terminal ; then
    wget -O /tmp/solarized-light.terminal https://raw.githubusercontent.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized%20Light.terminal;
    open --background -a Terminal /tmp/solarized-light.terminal;
  fi
fi

# set profile in terminal as default
if [[ ! `defaults read ~/Library/Preferences/com.apple.Terminal.plist "Default Window Settings"` == "solarized-dark" ]]; then
  defaults write ~/Library/Preferences/com.apple.Terminal.plist "Default Window Settings" "solarized-dark";
  defaults write ~/Library/Preferences/com.apple.Terminal.plist "Startup Window Settings" "solarized-dark";
fi
