#!/usr/bin/env bash

# Inspired by
# ~/.macos — https://mths.be/macos

sudo -v

# Disable the sound effects on boot (Apple Silicon)
sudo nvram StartupMute=%01

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain AppleLocale -string "en_DE"
defaults write NSGlobalDomain AppleLanguages -array "en-DE" "ru-DE" "de-DE"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null 2>&1 || \
  echo "systemsetup deprecated on this macOS version — set timezone manually in System Settings"

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 60
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true

# Disable hot corners
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Disable fn language switching
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

sudo chflags hidden ~/Music
sudo chflags hidden ~/Pictures
sudo chflags hidden ~/Movies
sudo chflags hidden ~/Public

# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Menu bar clock                                                               #
###############################################################################

defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowDate -bool false
defaults write com.apple.menuextra.clock ShowSeconds -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false
