#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";


# zsh comes from the Brewfile

# install oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "==> Installing Oh-my-zsh";
  # RUNZSH=no: the installer ends with `exec zsh -l`, which would replace the
  # shell sourcing bootstrap.sh and silently abort the rest of the run
  RUNZSH=no CHSH=no curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
fi
