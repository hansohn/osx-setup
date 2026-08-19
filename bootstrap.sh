#!/usr/bin/env bash

# set vars
BOOTSCRIPT_PATH=$(dirname "${BASH_SOURCE[0]}")

# import config vars
source "${BOOTSCRIPT_PATH}/config.sh"

# ----- dotfiles -----

dotfile_dir="${HOME}/.dotfiles"
backup_dir="${dotfile_dir}/bak/$(date +%Y%m%d)"
vim_dir="${HOME}/.vim"

# .config/nvim is deliberately absent -- it is its own repo (hansohn/nvim) and
# is cloned and linked by apps/nvim.sh
dotfiles=(
  '.bash_profile'
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
  "git"
  "iterm2"
  "macos-terminal"
  "nvim"
  "rust"
  "vagrant"
  "vim"
  "zsh"
)

# install homebrew first -- everything below it depends on brew being present
# shellcheck disable=SC1090
source "${BOOTSCRIPT_PATH}/apps/homebrew.sh"

# install packages
# brew bundle handles taps, formulae, casks and mas entries, and is idempotent,
# so no per-package guards are needed here
echo "==> Installing packages from Brewfile"
brew bundle install --file="${BOOTSCRIPT_PATH}/Brewfile"

# configure applications
# these run after brew bundle because several of them configure an application
# that brew bundle is what installs
# shellcheck disable=SC1090
for app in "${apps[@]}"; do
  source "${BOOTSCRIPT_PATH}/apps/${app}.sh"
done
