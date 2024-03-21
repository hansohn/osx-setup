#!/usr/bin/env bash

# set vars
BOOTSCRIPT_PATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${BOOTSCRIPT_PATH}/config.sh";

# ----- dotfiles -----

dotfile_dir="${HOME}/.dotfiles";
backup_dir="${dotfile_dir}/bak/$(date +%Y%m%d)";
vim_dir="${HOME}/.vim";

dotfiles=(
  '.bash_profile'
  '.tmux.conf'
  '.tmux.conf.local'
  '.vimrc'
  '.vim/plugins.vim'
  '.zshrc'
);

# create dirs
for dir in "${dotfile_dir}" "${backup_dir}" "${vim_dir}"; do
  if [ ! -d "${dir}" ]; then
    echo "==> Creating directory: ${dir}";
    mkdir -p "${dir}";
  fi
done

# copy dotfile contents
echo "==> Populating dotfile directory";
rsync -ah "${BOOTSCRIPT_PATH}/dotfiles/" "${dotfile_dir}/";

# manage dotfile
for dotfile in "${dotfiles[@]}"; do
  # backup if not symlink
  if [ -f "${HOME}/${dotfile}" ] && [ ! -L  "${HOME}/${dotfile}" ]; then
    echo "==> Archiving: ${HOME}/${dotfile} to ${backup_dir}";
    mv "${HOME}/${dotfile}" "${backup_dir}/${dotfile}";
  fi

  # symlink
  if [ ! -L "${HOME}/${dotfile}" ]; then
    echo "==> Linking: ${dotfile_dir}/${dotfile} to ${HOME}/${dotfile}"; 
    ln -s "${dotfile_dir}/${dotfile}" "${HOME}/${dotfile}";
  fi
done

# ----- personalization -----

source "${BOOTSCRIPT_PATH}/customizations/system-settings.sh";
source "${BOOTSCRIPT_PATH}/customizations/user-settings.sh";

# ----- apps -----

# list apps for customized install
apps=(
  "homebrew"
  "openssl"
  "wget"
  "nerdfonts"
  "vim"
  "git"
  "vagrant"
  "packer"
  "iterm2"
  "bash"
  "osx-terminal"
  "python"
);

# list cask apps for basic install
brew_formulae=(
  "ansible"
  "ansible-lint"
  "awscli"
  "cfn-lint"
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
  "mas"
  "nmap"
  "shellcheck"
  "teamookla/speedtest/speedtest"
  "terraform"
  "terraform-docs"
  "terragrunt"
  "tflint"
  "warrensbox/tap/tfswitch"
  "tmux"
  "tree"
  "wget"
  "yamllint"
);

# list cask apps for basic install
brew_casks=(
  "1password"
  "adobe-acrobat-reader"
  "appcleaner"
  "aws-vault"
  "brooklyn"
  "burp-suite"
  "dash6"
  "discord"
  "docker"
  "firefox"
  "geekbench"
  "google-chrome"
  "google-cloud-sdk"
  "google-drive"
  "gpg-suite-no-mail"
  "keybase"
  "obsidian"
  "postman"
  "pycharm-ce"
  "rectangle"
  "raycast"
  "session-manager-plugin"
  "slack"
  "spotify"
  "tor-browser"
  "ubiquiti-unifi-controller"
  "virtualbox"
  "virtualbox-extension-pack"
  "visual-studio-code"
  "wireshark"
  "zoom"
);

# mas apps
mas_apps=(
  "937984704"     # Amphetamine
  "1292198261"    # iMazing HEIC Converter
  "1033480833"    # Decompressor
)

# install selected custom apps
# shellcheck disable=SC1090
for app in "${apps[@]}"; do
  source "${BOOTSCRIPT_PATH}/apps/${app}.sh";
done

# install selected brew apps
for formula in "${brew_formulae[@]}"; do
  if ! brew ls | grep "^${formula}$" > /dev/null 2>&1; then
    echo "==> Installing ${formula}";
    brew install "${formula}";
  fi
done

# install selected cask apps
for cask in "${brew_casks[@]}"; do
  if ! brew ls | grep "^${cask}$" > /dev/null 2>&1; then
    echo "==> Installing ${cask}";
    brew install --cask "${cask}";
  fi
done

# install mas apps
for app in "${mas_apps[@]}"; do
  if ! mas list | grep -e "^${app}$" > /dev/null 2>&1; then
    mas install "${app}";
  fi
done
