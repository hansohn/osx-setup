#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;


# ----------------------------------------------
# Battery
# ----------------------------------------------

# Menu bar: show battery percentage
defaults write ~/Library/Preferences/com.apple.menuextra.battery.plist ShowPercent -string 'YES';


# ----------------------------------------------
# Dock
# ----------------------------------------------

# Postition on screen: bottom
defaults write ~/Library/Preferences/com.apple.dock.plist orientation -string 'bottom';

# Minimize windows into application icon
defaults write ~/Library/Preferences/com.apple.dock.plist minimize-to-application -bool true;

# Automatically hide and show the dock
defaults write ~/Library/Preferences/com.apple.dock.plist autohide -bool true;


# ----------------------------------------------
# Files and folders
# ----------------------------------------------

# unhide ~/Library
chflags nohidden ~/Library/;


# ----------------------------------------------
# Finder
# ----------------------------------------------

# Show these items on the Desktop: hard disks
defaults write ~/Library/Preferences/com.apple.finder.plist ShowHardDrivesOnDesktop -bool true;

# Show these items on the Desktop: external disks
defaults write ~/Library/Preferences/com.apple.finder.plist ShowExternalHardDrivesOnDesktop -bool true;

# Show these items on the Desktop: cd's, dvd's, and ipods
defaults write ~/Library/Preferences/com.apple.finder.plist ShowRemovableMediaOnDesktop -bool true;

# new finder windows show:
defaults write ~/Library/Preferences/com.apple.finder.plist NewWindowTarget -string 'PfVo';
defaults write ~/Library/Preferences/com.apple.finder.plist NewWindowTargetPath -string 'file:///';

# view | show recent tags
defaults write ~/Library/Preferences/com.apple.finder.plist ShowRecentTags -bool true;

# view | show path par
defaults write ~/Library/Preferences/com.apple.finder.plist ShowPathbar -bool true;


# ----------------------------------------------
# Screen Capture
# ----------------------------------------------

# set screen capture image location
if [ ! -f ${SCREENSHOT_LOC} ]; then
  mkdir -p ${SCREENSHOT_LOC};
fi
defaults write ~/Library/Preferences/com.apple.screencapture.plist location -string "${SCREENSHOT_LOC}";


# ----------------------------------------------
# Screen Saver
# ----------------------------------------------

# Require password immediately after sleep or screen saver begins
defaults write ~/Library/Preferences/com.apple.screensaver.plist askForPassword -int 1;
defaults write ~/Library/Preferences/com.apple.screensaver.plist askForPasswordDelay -int 0;


# ----------------------------------------------
# TextEdit
# ----------------------------------------------

# Use plain text mode for new TextEdit documents
defaults write ~/Library/Preferences/com.apple.TextEdit.plist RichText -int 0;

# Open and save files as UTF-8 in TextEdit
defaults write ~/Library/Preferences/com.apple.TextEdit.plist PlainTextEncoding -int 4;
defaults write ~/Library/Preferences/com.apple.TextEdit.plist PlainTextEncodingForWrite -int 4;


# ----------------------------------------------
# TrackPad & Mouse
# ----------------------------------------------

# Enable Trackpad tap-to-click 
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist Clicking -bool true;
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;
