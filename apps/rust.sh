#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";
source "${SCRIPTPATH}/../lib.sh";

# fall back only if config.sh did not set it -- this has to come after the
# source, or it is overwritten before anything reads it
RUST_NIGHTLY_ENABLED="${RUST_NIGHTLY_ENABLED:-false}"

# install rustup
if ! which rustc > /dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  export PATH="${HOME}/.cargo/bin:${PATH}"

  # install rust nightly
  if is_enabled "${RUST_NIGHTLY_ENABLED}" && which rustup > /dev/null 2>&1; then
    rustup toolchain install nightly
    rustup default nightly
  fi
fi
