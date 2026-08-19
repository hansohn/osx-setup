#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";


# neovim comes from the Brewfile

# the config is its own repo rather than vendored here, so it can be updated
# without a mac-setup release. it is cloned into the dotfile directory and
# symlinked from there, matching how bootstrap.sh handles everything else --
# but bootstrap.sh rsyncs that directory, which would strip a submodule's git
# linkage, so the clone happens here instead of in the dotfiles array.
NVIM_REPO="https://github.com/hansohn/nvim"
dotfile_dir="${HOME}/.dotfiles"
backup_dir="${dotfile_dir}/bak/$(date +%Y%m%d)"
nvim_src="${dotfile_dir}/.config/nvim"
nvim_dest="${HOME}/.config/nvim"

if [ -d "${nvim_src}/.git" ]; then
  # --ff-only so local commits are reported rather than silently merged over
  echo "==> Updating neovim config in ${nvim_src}";
  git -C "${nvim_src}" pull --ff-only || echo "==> Skipping: ${nvim_src} has diverged from ${NVIM_REPO}";
else
  # archive anything already sitting there, so a pre-existing config is
  # recoverable rather than overwritten by the clone. the archive name differs
  # from the one below so that a run archiving both does not nest them.
  if [ -e "${nvim_src}" ]; then
    echo "==> Archiving: ${nvim_src} to ${backup_dir}/dotfiles-config-nvim";
    mkdir -p "${backup_dir}"
    mv "${nvim_src}" "${backup_dir}/dotfiles-config-nvim"
  fi
  echo "==> Cloning ${NVIM_REPO} to ${nvim_src}";
  mkdir -p "$(dirname "${nvim_src}")"
  git clone "${NVIM_REPO}" "${nvim_src}"
fi

# backup if not symlink -- -e rather than -f, so the directory is archived too
# instead of being left in place
if [ -e "${nvim_dest}" ] && [ ! -L "${nvim_dest}" ]; then
  echo "==> Archiving: ${nvim_dest} to ${backup_dir}/.config/nvim";
  mkdir -p "${backup_dir}/.config"
  mv "${nvim_dest}" "${backup_dir}/.config/nvim"
fi

# symlink -- -n so an existing directory is replaced rather than having the
# link created inside it
if [ ! -L "${nvim_dest}" ]; then
  echo "==> Linking: ${nvim_src} to ${nvim_dest}";
  mkdir -p "$(dirname "${nvim_dest}")"
  ln -sfn "${nvim_src}" "${nvim_dest}"
fi
