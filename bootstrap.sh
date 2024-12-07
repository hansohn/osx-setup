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
  "bash"
  "fonts"
  "git"
  "homebrew"
  "iterm2"
  "openssl"
  "osx-terminal"
  "packer"
  "python"
  "terraform"
  "vagrant"
  "vim"
);

# list cask apps for basic install
brew_formulae=(
  "ansible"
  "ansible-lint"
  "aws-vault"
  "awscli"
  "cfn-lint"
  "curl"
  "doctl"
  "fd"
  "font-hack-nerd-font"
  "fzf"
  "gh"
  "gnupg"
  "go"
  "golangci-lint"
  "grep"
  "helm"
  "ipcalc"
  "jq"
  "jsonlint"
  "k9s"
  "kubernetes-cli"
  "lazygit"
  "mas"
  "neovim"
  "nmap"
  "ripgrep"
  "shellcheck"
  "teamookla/speedtest/speedtest"
  "terraform"
  "terraform-docs"
  "terraform-ls"
  "terragrunt"
  "tflint"
  "tmux"
  "tree"
  "tree-sitter"
  "warrensbox/tap/tfswitch"
  "wget"
  "yamllint"
);

# list cask apps for basic install
brew_casks=(
  "1password"
  "adobe-acrobat-reader"
  "appcleaner"
  "brooklyn"
  "burp-suite"
  "discord"
  "docker"
  "firefox"
  "google-chrome"
  "google-cloud-sdk"
  "google-drive"
  "keybase"
  "obsidian"
  "postman"
  "raycast"
  "rectangle"
  "session-manager-plugin"
  "slack"
  "spotify"
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
