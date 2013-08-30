# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "Regina"
sudo scutil --set HostName "Regina"
sudo scutil --set LocalHostName "Regina"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Regina"

# Set standby delay and auto power off to 12 hours (default is 1 hour)
sudo pmset -a standbydelay 43200
sudo pmset -a autopoweroffdelay 43200

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Trackpad: enable tap to click for this user and for the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#disable message: “the disk was not ejected properly”?
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist

#Disable DMG validation on mount
defaults write com.apple.frameworks.diskimages skip-verify TRUE

#Save dialog always detailed
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

#Warning on first app run
defaults write com.apple.LaunchServices LSQuarantine -bool false

#Extention change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#Spell check in all apps
defaults write -g WebContinuousSpellCheckingEnabled -bool TRUE 
defaults write -g WebAutomaticTextReplacementEnabled -bool TRUE

#Disable TM Local Backup Storage
sudo tmutil disablelocal