#!/usr/bin/env bash


# install homebrew
if ! which brew > /dev/null 2>&1; then
  if [[ $(xcode-select --version) ]] && [[ $(which ruby) ]]; then
    echo "==> Instaling HomeBrew";
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash;

    # if apple silicon update path
    if [ -d "/opt/homebrew" ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # Only append to ~/.zprofile when it is a real file we own and does not
      # already set up brew. If it is a symlink, it is managed by a dotfiles
      # repo and appending would write through into that repo's working tree.
      if [ -L "${HOME}/.zprofile" ]; then
        echo "==> Skipping ~/.zprofile (symlinked; managed elsewhere)"
      elif grep -qs 'brew shellenv' "${HOME}/.zprofile"; then
        echo "==> ~/.zprofile already sets up HomeBrew"
      else
        echo "==> Adding HomeBrew to PATH"
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "${HOME}/.zprofile"
      fi

      # fix zsh compaudit warnings
      chmod 755 "/opt/homebrew/share"
    fi

    # update brew
    echo "==> Updating HomeBrew";
    brew update && brew cleanup;
    echo "==> Inspecting HomeBrew for configuration issues";
    brew doctor;
  else
    echo "==> Error: You need 'XCode Tools' to continue, please run 'xcode-select --install'";
    exit 1;
  fi
fi

# Taps are declared in the Brewfile and installed by `brew bundle`.
