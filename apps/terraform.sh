#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh";

taps=(
  "hashicorp/tap"
  "warrensbox/tap"
)

formulae=(
  "hashicorp/tap/terraform"
  "terraform-docs"
  "terraform-ls"
  "terragrunt"
  "tflint"
  "tfsec"
)

# install taps
for tap in "${taps[@]}"; do
  if ! brew tap | grep "${tap}" > /dev/null 2>&1; then
    brew tap "${tap}";
  fi
done

# install formulae
for formula in "${formulae[@]}"; do
  if ! brew ls "${formula}" > /dev/null 2>&1; then
    echo "==> Installing ${formula}";
    brew install "${formula}";
  fi
done
