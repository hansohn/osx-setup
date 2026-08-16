#!/usr/bin/env bash

# set vars
BOOTSCRIPT_PATH=$(dirname "${BASH_SOURCE[0]}")

# import config vars
source "${BOOTSCRIPT_PATH}/config.sh"

# ----- dotfiles -----

dotfile_dir="${HOME}/.dotfiles"
backup_dir="${dotfile_dir}/bak/$(date +%Y%m%d)"
vim_dir="${HOME}/.vim"

dotfiles=(
  '.bash_profile'
  '.config/nvim'
  '.config/tmux/tmux.conf'
  '.vimrc'
  '.vim/plugins.vim'
  '.zshrc'
)

# create dirs
for dir in "${dotfile_dir}" "${backup_dir}" "${vim_dir}"; do
  if [ ! -d "${dir}" ]; then
    echo "==> Creating directory: ${dir}"
    mkdir -p "${dir}"
  fi
done

# copy dotfile contents
echo "==> Populating dotfile directory"
rsync -ah "${BOOTSCRIPT_PATH}/dotfiles/" "${dotfile_dir}/"

# manage dotfile
for dotfile in "${dotfiles[@]}"; do
  # skip anything the dotfiles directory does not actually provide, rather
  # than linking it and leaving a dangling symlink behind
  if [ ! -e "${dotfile_dir}/${dotfile}" ]; then
    echo "==> Skipping: ${dotfile} (not present in ${dotfile_dir})"
    continue
  fi

  # backup if not symlink -- -e rather than -f, so directory entries such as
  # .config/nvim are archived too instead of being left in place
  if [ -e "${HOME}/${dotfile}" ] && [ ! -L "${HOME}/${dotfile}" ]; then
    echo "==> Archiving: ${HOME}/${dotfile} to ${backup_dir}"
    mkdir -p "$(dirname "${backup_dir}/${dotfile}")"
    mv "${HOME}/${dotfile}" "${backup_dir}/${dotfile}"
  fi

  # symlink -- -n so an existing directory is replaced rather than having the
  # link created inside it
  if [ ! -L "${HOME}/${dotfile}" ]; then
    echo "==> Linking: ${dotfile_dir}/${dotfile} to ${HOME}/${dotfile}"
    mkdir -p "$(dirname "${HOME}/${dotfile}")"
    ln -sfn "${dotfile_dir}/${dotfile}" "${HOME}/${dotfile}"
  fi
done

# ----- personalization -----

source "${BOOTSCRIPT_PATH}/customizations/system-settings.sh"
source "${BOOTSCRIPT_PATH}/customizations/user-settings.sh"

# ----- apps -----

# list apps for customized install
apps=(
  "bash"
  "fonts"
  "git"
  "homebrew"
  "iterm2"
  "openssl"
  "macos-terminal"
  "packer"
  "python"
  "rust"
  "terraform"
  "vagrant"
  "vim"
  "zsh"
)

# list of homebrew taps to add
brew_taps=(
  "terraform-linters/tap"
  "warrensbox/tap"
)

# list of homebrew formulae to install
brew_formulae=(
  "ansible"
  "ansible-lint"
  "argocd"
  "aws-vault"
  "awscli"
  "bat"
  "cfn-lint"
  "curl"
  "doctl"
  "fd"
  "fzf"
  "gh"
  "gnupg"
  "go"
  "golangci-lint"
  "grep"
  "helm"
  "ipcalc"
  "istioctl"
  "jq"
  "jsonlint"
  "k9s"
  "kind"
  "kubernetes-cli"
  "kustomize"
  "lazygit"
  "lua"
  "luajit"
  "luarocks"
  "mas"
  "neovim"
  "nmap"
  "nvm"
  "ripgrep"
  "shellcheck"
  "terraform-docs"
  "terraform-ls"
  "terragrunt"
  "tmux"
  "tree"
  "tree-sitter"
  "warrensbox/tap/tfswitch"
  "wget"
  "yamllint"
  "zsh"
)

# list of homebrew casks to install
brew_casks=(
  "1password"
  "adobe-acrobat-reader"
  "appcleaner"
  "discord"
  "docker"
  "firefox"
  "font-hack-nerd-font"
  "google-chrome"
  "google-drive"
  "obsidian"
  "postman"
  "raycast"
  "rectangle"
  "session-manager-plugin"
  "slack"
  "spotify"
  "terraform-linters/tap/tflint"
  "virtualbox@beta"
  "visual-studio-code"
  "wireshark"
  "zoom"
)

# mas apps
mas_apps=(
  "1033480833" # Decompressor
  "1292198261" # iMazing HEIC Converter
  "302584613"  # Kindle
  "937984704"  # Amphetamine
)

# install selected custom apps
# shellcheck disable=SC1090
for app in "${apps[@]}"; do
  source "${BOOTSCRIPT_PATH}/apps/${app}.sh"
done

# add taps
for tap in "${brew_taps[@]}"; do
  if ! brew tap | grep -q "^${tap}$"; then
    echo "==> Tapping ${tap}"
    brew tap "${tap}"
  fi
done

# install selected brew apps
# `brew ls` prints the bare name, so strip any user/tap/ prefix before matching
# or a tapped formula never looks installed and reinstalls on every run
for formula in "${brew_formulae[@]}"; do
  if ! brew ls | grep "^${formula##*/}$" >/dev/null 2>&1; then
    echo "==> Installing ${formula}"
    brew install "${formula}"
  fi
done

# install selected cask apps
for cask in "${brew_casks[@]}"; do
  if ! brew ls | grep "^${cask##*/}$" >/dev/null 2>&1; then
    echo "==> Installing ${cask}"
    brew install --cask "${cask}"
  fi
done

# install mas apps
# `mas list` prints "<id>  <Name>  (<version>)", so anchoring on the id alone
# never matches and every app is reinstalled on each run
for app in "${mas_apps[@]}"; do
  if ! mas list | grep -qE "^[[:space:]]*${app}[[:space:]]"; then
    mas install "${app}"
  fi
done
