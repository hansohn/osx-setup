#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")

# import config vars
source "${SCRIPTPATH}/../config.sh"

# iterm2 itself comes from the Brewfile. This script only configures it.
#
# Previously all of the below sat inside an `if ! brew ls iterm2` guard, so it
# ran on first install and never again -- a re-run installed no themes and no
# shell integration.

if [ ! -d "/Applications/iTerm.app" ]; then
  echo "==> Skipping iTerm2 configuration (not installed)"
  return 0 2>/dev/null || exit 0
fi

# shell integration
if [ ! -f "${HOME}/.iterm2_shell_integration.zsh" ]; then
  echo "==> Installing iTerm2 shell integration"
  curl -L iterm2.com/misc/install_shell_integration.sh | bash
fi

# colour schemes
# name:url pairs; each is fetched and handed to iTerm2, which imports it
themes=(
  "solarized_dark:https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors"
  "solarized_light:https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors"
  "tokyonight_day:https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_day.itermcolors"
  "tokyonight_moon:https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_moon.itermcolors"
  "tokyonight_night:https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_night.itermcolors"
  "tokyonight_storm:https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_storm.itermcolors"
)

for theme in "${themes[@]}"; do
  name="${theme%%:*}"
  url="${theme#*:}"
  echo "==> Installing iTerm2 ${name} theme"
  if curl -fsSL "${url}" -o "/tmp/${name}.itermcolors"; then
    open --background -a /Applications/iTerm.app "/tmp/${name}.itermcolors"
  else
    echo "==> Warning: could not fetch ${name} theme"
  fi
done
