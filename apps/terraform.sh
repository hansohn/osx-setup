#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

taps=(
  "hashicorp/tap"
  "terraform-linters/tap"
)

formulae=(
  "hashicorp/tap/terraform"
  "terraform-docs"
  "terraform-ls"
  "terragrunt"
  "tfsec"
)

# tflint is cask-only: there is no tflint formula in homebrew-core any more,
# so `brew install tflint` fails outright
casks=(
  "terraform-linters/tap/tflint"
)

# install taps
for tap in "${taps[@]}"; do
  if ! brew tap | grep -qx "${tap}"; then
    echo "==> Tapping ${tap}";
    brew tap "${tap}";
  fi
done

# install formulae
# `brew ls` prints the bare token, so strip any user/tap/ prefix before
# matching or a tapped formula never looks installed and reinstalls every run
for formula in "${formulae[@]}"; do
  if ! brew ls --formula | grep -qx "${formula##*/}"; then
    echo "==> Installing ${formula}";
    brew install "${formula}";
  fi
done

# install casks
for cask in "${casks[@]}"; do
  if ! brew ls --cask | grep -qx "${cask##*/}"; then
    echo "==> Installing ${cask}";
    brew install --cask "${cask}";
  fi
done
