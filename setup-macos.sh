#!/usr/bin/env bash

# Inspired by
# ~/.macos — https://mths.be/macos

sudo -v

# Disable the sound effects on boot
# sudo nvram StartupMute=%01 - alternative. 01 - disabled, 00 - enabled
# This should reduce the volume
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain AppleLocale -string "en_DE"
defaults write NSGlobalDomain AppleLanguages -array "en-DE" "ru-DE" "de-DE"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize 60
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
