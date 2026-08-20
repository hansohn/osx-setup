#!/usr/bin/env bash
#
# Host prerequisites that have to be in place before Homebrew or the customizations
# run. Sourced by install.sh -- NOT meant to be executed on its own.
#
# The sudo keepalive below is tied to $$, so it has to share a process with the
# rest of the run. Executed as its own script the keepalive would die on exit and
# sudo's timestamp would lapse partway through brew bundle.
#
# Every step is guarded, so a re-run costs nothing.

# ----- xcode command line tools -----
# Usually already present: `git clone` on a factory Mac triggers the installer
# through the /usr/bin/git shim. This is the safety net for a curl|bash flow.
if ! xcode-select -p > /dev/null 2>&1; then
  echo "==> Installing Xcode Command Line Tools";
  xcode-select --install 2> /dev/null

  # --install returns immediately while a GUI installer runs, so block here or
  # Homebrew races the toolchain it depends on
  echo "==> Waiting for Xcode Command Line Tools to finish installing";
  until xcode-select -p > /dev/null 2>&1; do
    sleep 10;
  done
fi

# ----- rosetta -----
# Opt-in via ROSETTA_ENABLED in config.sh. Nothing in the Brewfile needs it.
if [ "$(uname -m)" == "arm64" ] && is_enabled "${ROSETTA_ENABLED}"; then
  # functional probe rather than a path check -- the install location has moved
  # between macOS releases
  if ! arch -x86_64 /usr/bin/true > /dev/null 2>&1; then
    echo "==> Installing Rosetta 2";
    softwareupdate --install-rosetta --agree-to-license;
  fi
fi

# ----- sudo -----
# customizations/system-settings.sh calls sudo a dozen times over a run that
# lasts far longer than sudo's default five minute timestamp.
echo "==> Caching sudo credentials for this run";
sudo -v;

# Refresh until the parent exits. `kill -0 "$$"` tests that install.sh is still
# alive, so this never outlives the run that started it.
while true; do
  sudo -n true;
  sleep 60;
  kill -0 "$$" > /dev/null 2>&1 || exit;
done 2> /dev/null &
