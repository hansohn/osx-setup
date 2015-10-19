#!/usr/bin/env bash

# dotfiles (relative to ~)
bp=".bash_profile";                       # bash
vrc=".vimrc";                             # vim
vun=".vim/plugins.vim";                    # vundle
dbv=".vim/dosbatch.vim";                  # dosbatch.vim
af=($bp $vrc $vun $dbv);                  # all files

# directories (relative to ~)
dfd=".dotfiles";                          # dotfile dir
vimd=".vim";                              # vim dir
dfvd="$dfd/$vimd";                        # dotfile vim dir
bakd="$dfd/bak/$(date +%Y%m%d)";          # dotfile bak
bakvd="$bakd/$vimd";                      # dotfile bak vim dir
ad=($dfd $bakd $bakvd $vimd $dfvd);       # all directories

# create dirs
for d in ${ad[@]}; do
  if [ ! -d $d ]; then
    mkdir -p "$(echo ~)/$d";
  fi
done

# manage dotfiles
for f in ${af[@]}; do
  # backup
  if [ -f ~/$f ]; then
    mv ~/$f ~/$bakd/$f;
  fi
  # copy
  cp `dirname "${BASH_SOURCE[0]}"`/$f ~/$dfd/$f;
  # symlink
  ln -s "$(echo ~)/$dfd/$f" "$(echo ~)/$f";
done
