#!/usr/bin/env bash

# set vars
SCRIPTPATH=`dirname "${BASH_SOURCE[0]}"`;

# import config vars
source ${SCRIPTPATH}/../config.sh;

# -- com.apple.dock.plist --

# Automatically hide and show the dock
defaults write ~/Library/Preferences/com.apple.dock.plist autohide -bool true;

# Postition on screen: bottom
defaults write ~/Library/Preferences/com.apple.dock.plist orientation bottom;


# -- com.apple.finder.plist --

# Show these items on the Desktop: external disks
defaults write ~/Library/Preferences/com.apple.finder.plist ShowExternalHardDrivesOnDesktop -boot true;

# Show these items on the Desktop: hard disks
defaults write ~/Library/Preferences/com.apple.finder.plist ShowHardDrivesOnDesktop -boot true;

# view | show path par
defaults write ~/Library/Preferences/com.apple.finder.plist ShowPathbar -boot true;

# Show these items on the Desktop: cd's, dvd's, and ipods
defaults write ~/Library/Preferences/com.apple.finder.plist ShowRemovableMediaOnDesktop -bool true;


# -- com.apple.screencapture.plist --

# set screen capture image location
if [ ! -f ${SCREENSHOT_LOC} ]; then
  mkdir -p ${SCREENSHOT_LOC};
fi
defaults write ~/Library/Preferences/com.apple.screencapture.plist location "${SCREENSHOT_LOC}";


# -- com.apple.screensaver.plist --

# Require password immediately after sleep or screen saver begins
defaults write ~/Library/Preferences/com.apple.screensaver askForPassword -int 1;
defaults write ~/Library/Preferences/com.apple.screensaver askForPasswordDelay -int 0;
