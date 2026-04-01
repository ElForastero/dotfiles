#!/usr/bin/env bash
# Apply macOS system defaults (Dock, Finder, login window, menu bar clock, etc.)
# Safe to re-run. Some changes require logout or restart to take effect fully.

set -e

echo "Applying macOS defaults..."

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock tilesize -int 48

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Login window (requires sudo)
echo "The following settings require sudo (login window). You may be prompted for your password."
sudo defaults write com.apple.loginwindow GuestEnabled -bool false
sudo defaults write com.apple.loginwindow SHOWFULLNAME -bool false

# Menu bar clock (24h, date, weekday)
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowAMPM -bool false
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfMonth -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# Activity Monitor: CPU in dock icon, show all processes
defaults write com.apple.ActivityMonitor IconType -int 5
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Screenshots: no shadow, save to Desktop/Screenshots, PNG
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"
defaults write com.apple.screencapture type -string "png"

# Move windows by dragging any part of the window
defaults write -g NSWindowShouldDragOnGesture -bool true

# Disable windows opening animation
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Disable Displays have separate Spaces
defaults write com.apple.spaces spans-displays -bool true

# Restart affected apps
for app in Dock Finder SystemUIServer; do
  pgrep -x "$app" >/dev/null && killall "$app"
done

echo "macOS defaults applied. You may need to log out for login-window changes."
