#!/usr/bin/env bash

# load config file
source `dirname "${BASH_SOURCE[0]}"`/../config.sh

# list apps for customized install
custom_install=(
  "homebrew"
  "openssl"
  "wget"
  "vim"
  "git"
  "virtualbox"
  "chefdk"
  "ruby"
  "vagrant"
  "packer"
  "iterm2"
  "atom"
  "bash"
  "osx-terminal"
  "python"
  "nodejs"
  "docker"
  "java"
  "hadoop"
)

# list cask apps for basic install
basic_brew_install=(
  "awscli"
  "cmake"
  "csshx"
  "curl"
  "go"
  "dep"
  "jq"
  "tmux"
)

# list cask apps for basic install
basic_cask_install=(
  "adobe-acrobat-reader"
  "aerial"
  "appcleaner"
  "caffeine"
  "dropbox"
  "firefox"
  "flux"
  "google-backup-and-sync"
  "google-chrome"
  "lastpass"
  "meld"
  "postman"
  "slack"
  "spectacle"
  "spotify"
  "transmission"
  "wireshark"
)

# install selected custom apps
for app in ${custom_install[@]}; do
  source `dirname "${BASH_SOURCE[0]}"`/${app}.sh;
done

# install selected brew apps
for brew in ${basic_brew_install[@]}; do
  if ! brew ls | grep "^${brew}$" > /dev/null 2>&1; then
    echo "==> Installing ${brew}";
    brew install ${brew};
  fi
done

# install selected cask apps
for cask in ${basic_cask_install[@]}; do
  if ! brew cask ls | grep "^${cask}$" > /dev/null 2>&1; then
    echo "==> Installing ${cask}";
    brew cask install ${cask};
  fi
done
