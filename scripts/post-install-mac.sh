#### ************************* MAC PARAMETERS CONFIGURATION ********************************
echo "Setting up Mac configuration parameters"

# Screenshots in JPG
defaults write com.apple.screencapture type JPG

### FINDER
# Sound effects
defaults write NSGlobalDomain com.apple.sound.beep.sound /System/Library/Sounds/Blow.aiff

# Show Path/Status Bar, List view, extensions
defaults write com.apple.finder ShowStatusBar -bool "true"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowPathbar -bool "true"
defaults write NSGlobalDomain AppleShowAllExtensions -bool "true"

# Find default folder to $HOME
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Dark Theme
defaults write "Apple Global Domain" "AppleInterfaceStyle" "Dark"

# Quickview text selection
defaults write com.apple.finder QLEnableTextSelection -bool "true"

# No .DS_STORE on drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"

# Ask Password right after save screen
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Keyboard repetition delay
defaults write NSGlobalDomain KeyRepeat -int 1
# Keystroke time delay
defaults write NSGlobalDomain InitialKeyRepeat -int 10

## CONTROL CENTER SETTINGS
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool "true"
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist NowPlaying -int 18

## TOUCHBAR SETTINGS
defaults write com.apple.touchbar.agent PresentationModeGlobal -string fullControlStrip
defaults write com.apple.touchbar.agent PresentationModeFnModes '<dict><key>fullControlStrip</key><string>functionKeys</string></dict>'
defaults write com.apple.controlstrip FullCustomized '("com.apple.system.group.brightness","com.apple.system.group.keyboard-brightness","com.apple.system.group.media","com.apple.system.group.volume","com.apple.system.screen-lock","com.apple.system.do-not-disturb")'

## DOCK Settings
# Auto hide
defaults write com.apple.dock "autohide" -bool "true"
# No delay
defaults write com.apple.dock "autohide-delay" -float "0"
# Minimum text size
defaults write com.apple.dock tilesize -int 45
# Magnification off
defaults write com.apple.dock magnification -bool "false"

## HOT CORNERS
defaults write com.apple.dock "mru-spaces" -bool "false"

# TOP LEFT : Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# TOP RIGHT : - 
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# DOWN LEFT : Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# DOWN RIGHT : Lock
defaults write com.apple.dock wvous-br-corner -int 13
defaults write com.apple.dock wvous-br-modifier -int 0

defaults write com.apple.finder ShowHarDrivesOnDesktop -bool "true"

## ADD SOME APPS TO DOCK
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Calendar.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Notes.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Telegram.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Alacritty.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/System Preferences.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## Restart Dock/Finder & Reboot
echo "Finder et Dock restarted... please reboot!"
pkill Docker Finder ControlStrip TouchBarServer

echo 0 > ./scripts/executed.txt