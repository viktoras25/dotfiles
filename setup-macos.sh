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

# Do not show recent apps
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize 60
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock show-recents -bool false
