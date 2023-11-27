#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# dotfiles
dotfiles=(
  '.bash_profile'
  '.vimrc'
  '.vim/plugins.vim'
  '.zshrc'
);

# dirs
dotfile_dir=".dotfiles";                     # dotfile dir
backup_dir="$dotfile_dir/bak/$(date +%s)";   # dotfile bak
vim_dir=".vim";                              # vim dir
dirs=(
  "$backup_dir"
  "$dotfile_dir"
  "$dotfile_dir/$vim_dir"
  "$dotfile_dir/bak/$(date +%s)"
  "$vim_dir"
);

# create dirs
for dir in ${dirs[@]}; do
  if [ ! -d $dir ]; then
    mkdir -p "$HOME/$dir";
  fi
done

# manage dotfiles
for dotfile in ${dotfiles[@]}; do
  # backup
  if [ -f ~/$dotfile ]; then
    mv ~/$dotfile ~/$backup_dir/$dotfile;
  fi

  # copy
  cp ${SCRIPTPATH}/$dotfile $HOME/$dotfile_dir/$dotfile;

  # symlink
  ln -s "$HOME/$dotfile_dir/$dotfile" "$HOME/$dotfile";
done
