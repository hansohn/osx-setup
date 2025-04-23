#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")

# import config vars
source "${SCRIPTPATH}/../config.sh"

# install prerequisites
source "${SCRIPTPATH}/homebrew.sh"

# Install iTerm2
if ! brew ls iterm2 >/dev/null 2>&1; then
  echo "==> Installing iTerm2"
  brew install --cask iterm2

  echo "==> Installing iTerm2 Shell Integration"
  curl -L iterm2.com/misc/install_shell_integration.sh | bash

  echo "==> Installing iTerm2 Solarized Dark Theme"
  curl -fsSL https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors -o /tmp/solarized_dark.itermcolors
  open --background -a /Applications/iTerm.app /tmp/solarized_dark.itermcolors

  echo "==> Installing iTerm2 Solarized Light Theme"
  curl -fsSL https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors -o /tmp/solarized_light.itermcolors
  open --background -a /Applications/iTerm.app /tmp/solarized_light.itermcolors

  echo "==> Installing iTerm2 Tokyo Night Day Theme"
  curl -fsSL https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_day.itermcolors -o /tmp/tokyonight_day.itermcolors
  open --background -a /Applications/iTerm.app /tmp/tokyonight_day.itermcolors

  echo "==> Installing iTerm2 Tokyo Night Moon Theme"
  curl -fsSL https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_moon.itermcolors -o /tmp/tokyonight_moon.itermcolors
  open --background -a /Applications/iTerm.app /tmp/tokyonight_moon.itermcolors

  echo "==> Installing iTerm2 Tokyo Night Night Theme"
  curl -fsSL https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_night.itermcolors -o /tmp/tokyonight_night.itermcolors
  open --background -a /Applications/iTerm.app /tmp/tokyonight_night.itermcolors

  echo "==> Installing iTerm2 Tokyo Night Storm Theme"
  curl -fsSL https://raw.githubusercontent.com/folke/tokyonight.nvim/refs/heads/main/extras/iterm/tokyonight_storm.itermcolors -o /tmp/tokyonight_storm.itermcolors
  open --background -a /Applications/iTerm.app /tmp/tokyonight_storm.itermcolors
fi
