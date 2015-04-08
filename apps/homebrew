#!/usr/bin/env bash

source ./_config;

# check for xcode tools, install if missing
if ! `xcode-select --version` > /dev/null 2>&1; then
  echo "==> Installing Xcode Tools";
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access VALUES('kTCCServiceAccessibility','com.apple.ScriptEditor.id.xcode-tools-installer',0,1,1,NULL)";
  open ./xcode-tools-installer.app;
fi

# install homebrew
if ! which brew > /dev/null 2>&1; then
  if which ruby > dev/null 2>&1; then
    echo "==> Instaling HomeBrew";
    sudo ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    echo "==> Updating HomeBrew";
    brew update && brew cleanup;
    echo "==> Inspecting HomeBrew for configuration issues";
    brew doctor;
  else
    echo "==> Error: Need Ruby to continue, please run 'xcode-select --install'";
    exit 1;
  fi
fi

# install brew-cask
if which brew > /dev/null 2>&1; then
  if ! brew ls | grep '^brew-cask$' > /dev/null 2>&1; then
    echo "==> Installing Brew-Cask"
    brew install caskroom/cask/brew-cask;
    echo "==> Updating Brew-Cask"
    brew cask update && brew cask cleanup;
    echo "== Inspecting Brew-Cask for configuration issues"
    brew cask doctor;
  fi
fi
