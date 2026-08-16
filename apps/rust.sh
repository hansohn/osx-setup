#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");
RUSTUP_INSTALL_NIGHTLY="true"

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install rustup
if ! which rustc > /dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  export PATH="${HOME}/.cargo/bin:${PATH}"

  # install rust nightly
  if [ "${RUSTUP_INSTALL_NIGHTLY}" == "true" ] && which rustup > /dev/null 2>&1; then
    rustup toolchain install nightly
    rustup default nightly
  fi
fi
