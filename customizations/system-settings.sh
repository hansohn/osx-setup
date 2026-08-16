#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# ----------------------------------------------
# Date & Time
# ----------------------------------------------

sudo systemsetup -settimezone "${TIMEZONE}";
sudo systemsetup -setnetworktimeserver "${TIMESERVER}";
sudo systemsetup -setusingnetworktime "on";


# ----------------------------------------------
# Application layer firewall
# ----------------------------------------------

# Writing to com.apple.alf.plist directly is the pre-Ventura interface and no
# longer takes effect -- `defaults read com.apple.alf` reports no such domain
# on macOS 26. socketfilterfw is the supported tool.
firewall='/usr/libexec/ApplicationFirewall/socketfilterfw';

if [ -x "${firewall}" ]; then
  # Enable the firewall
  sudo "${firewall}" --setglobalstate on;

  # Allow signed apps
  sudo "${firewall}" --setallowsigned on;

  # Disable stealth mode
  sudo "${firewall}" --setstealthmode off;

  # NOTE: the old loggingenabled key has no socketfilterfw equivalent --
  # macOS 26 exposes no logging flag, so that setting is dropped.
fi


# ----------------------------------------------
# Login window
# ----------------------------------------------

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist AdminHostInfo -string 'HostName';

# Disallow Guest account to login
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist GuestEnabled -bool false;

# Show a message when the screen is locked
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist LoginwindowText \
  -string "If found please contact ${EMAIL_ADDRESS}. Thank you!";

# Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true;

# Don't show any password hints
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist RetriesUntilHint -int 0;

# Allow fast user switching
sudo defaults write /Library/Preferences/.GlobalPreferences.plist MultipleSessionEnabled -bool false;


# ----------------------------------------------
# NSGlobalDomain
# ----------------------------------------------

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false;

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false;

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;
