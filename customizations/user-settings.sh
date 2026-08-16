#!/usr/bin/env bash

# set vars
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# import config vars
source "${SCRIPTPATH}/../config.sh";

# NOTE: these all address preference domains rather than plist file paths.
# cfprefsd caches user preferences in memory and can overwrite a file written
# behind its back, so `defaults write com.apple.dock autohide` is reliable
# where `defaults write ~/Library/Preferences/com.apple.dock.plist autohide`
# is not.


# ----------------------------------------------
# Menu bar
# ----------------------------------------------

# Show battery percentage. The com.apple.menuextra.battery domain was retired
# when the menu bar moved into Control Center; that key no longer exists.
defaults write com.apple.controlcenter BatteryShowPercentage -bool true;


# ----------------------------------------------
# Dock
# ----------------------------------------------

# Position the Dock on the bottom of the screen
defaults write com.apple.dock orientation -string 'bottom';

# Minimize windows into their application icon
defaults write com.apple.dock minimize-to-application -bool true;

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true;


# ----------------------------------------------
# Finder
# ----------------------------------------------

# Show the ~/Library folder
chflags nohidden "${HOME}/Library";

# Show hard drives, external drives and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true;
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true;
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true;

# Expand the Places section of the sidebar
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true;

# Open new windows in the home directory
defaults write com.apple.finder NewWindowTarget -string 'PfHm';
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/";

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false;

# Show the path bar
defaults write com.apple.finder ShowPathbar -bool true;


# ----------------------------------------------
# Screenshots
# ----------------------------------------------

# -d, not -f: SCREENSHOT_LOC is a directory, so `! -f` was always true and the
# mkdir ran on every invocation
if [ ! -d "${SCREENSHOT_LOC}" ]; then
  mkdir -p "${SCREENSHOT_LOC}";
fi

# Save screenshots to the configured location
defaults write com.apple.screencapture location -string "${SCREENSHOT_LOC}";


# ----------------------------------------------
# Screensaver
# ----------------------------------------------

# Require a password immediately after sleep or screensaver
defaults write com.apple.screensaver askForPassword -int 1;
defaults write com.apple.screensaver askForPasswordDelay -int 0;


# ----------------------------------------------
# TextEdit
# ----------------------------------------------

# Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0;

# Open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4;
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4;


# ----------------------------------------------
# Trackpad
# ----------------------------------------------

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true;
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;


# ----------------------------------------------
# Apply
# ----------------------------------------------

# Preference changes are not picked up until the owning process restarts.
# Without this the Dock, Finder and menu bar settings above do nothing until
# the next logout.
for app in "ControlCenter" "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1 || true;
done
