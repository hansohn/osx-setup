#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;


# -- NSGlobalDomain --

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


# -- com.apple.loginwindow --

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disallow Guest account to login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show a message when the screen is locked
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "If found please contact ${EMAIL_ADDRESS}. Thank you!"

# "List of users" (FALSE) or "Name and password" (TRUE) indicated at login screen
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool true


# -- systemsetup --

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "${TIMEZONE}"

