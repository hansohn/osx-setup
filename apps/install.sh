#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source ${SCRIPTPATH}/../config.sh;

# list apps for customized install
apps=(
  "homebrew"
  "openssl"
  "wget"
  "vim"
  "git"
  "vagrant"
  "packer"
  "iterm2"
  "bash"
  "osx-terminal"
  "python"
)

# list cask apps for basic install
brew_formulae=(
  "awscli"
  "cmake"
  "curl"
  "doctl"
  "gh"
  "go"
  "golangci-lint"
  "grep"
  "ipcalc"
  "jq"
  "jsonlint"
  "kubernetes-cli"
  "macvim"
  "mas"
  "nmap"
  "shellcheck"
  "speedtest"
  "terraform"
  "terraform-docs"
  "terragrunt"
  "tfenv"
  "tflint"
  "tfswitch"
  "tmux"
  "wget"
  "yamllint"
)

# list cask apps for basic install
brew_casks=(
  "1password"
  "adobe-acrobat-reader"
  "appcleaner"
  "aws-vault"
  "burp-suite"
  "dash6"
  "discord"
  "docker"
  "firefox"
  "geekbench"
  "google-chrome"
  "google-cloud-sdk"
  "gpg-suite-no-mail"
  "keybase"
  "meld"
  "postman"
  "pycharm-ce"
  "rectangle"
  "slack"
  "spotify"
  "tor-browser"
  "ubiquiti-unifi-controller"
  "virtualbox"
  "virtualbox-extension-pack"
  "visual-studio-code"
  "wireshark"
  "zoom"
)

# install selected custom apps
for app in ${apps[@]}; do
  source ${SCRIPTPATH}/apps/${app}.sh;
done

# install selected brew apps
for formula in ${brew_formulae[@]}; do
  if ! brew ls | grep "^${formula}$" > /dev/null 2>&1; then
    echo "==> Installing ${formula}";
    brew install ${formula};
  fi
done

# install selected cask apps
for cask in ${brew_casks[@]}; do
  if ! brew ls | grep "^${cask}$" > /dev/null 2>&1; then
    echo "==> Installing ${cask}";
    brew install --cask ${cask};
  fi
done
