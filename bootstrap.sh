#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source ${SCRIPTPATH}/config.sh;

# ----- dotfiles -----

dotfile_dir="$HOME/.dotfiles";
backup_dir="$dotfile_dir/bak/$(date +%s)";
vim_dir="$HOME/.vim";

dotfiles=(
  '.bash_profile'
  '.vimrc'
  '.vim/plugins.vim'
  '.zshrc'
);

# create dirs
for dir in $dotfile_dir $backup_dir $vim_dir; do
  if [ ! -d $dir ]; then
    echo "==> Creating directory: $dir"
    mkdir -p "$HOME/$dir";
  fi
done

# copy dotfile contents
if [ -z "$(ls -A $dotfile_dir)" ]; then
  echo "==> Populating dotfile directory"
  cp -R ${SCRIPTPATH}/dotfiles $HOME/$dotfile_dir
fi


# manage dotfile
for dotfile in ${dotfiles[@]}; do
  # backup if not symlink
  if [ -f ~/$dotfile ] && [ ! -L  ~/$dotfile ]; then
    echo "==> Archiving: $HOME/$dotfile to $backup_dir"
    mv ~/$dotfile ~/$backup_dir/$dotfile;
  fi

  # symlink
  if [ ! -L  ~/$dotfile ]; then
    echo "==> Linking: $dotfile_dir/$dotfile to $HOME/$dotfile" 
    ln -s "$dotfile_dir/$dotfile" "$HOME/$dotfile";
  fi
done

# ----- personalization -----

source $SCRIPTPATH/customizations/system-settings.sh
source $SCRIPTPATH/customizations/user-settings.sh

# ----- apps -----

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
