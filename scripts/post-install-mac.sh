#### ******************************** CONFIGURE ZSH BY DEFAULT *****************************
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

#### ************************* MAC PARAMETERS CONFIGURATION ********************************
echo "Setting up Mac configuration parameters"

### FINDER
# Show ~/Library in $HOME folder
chflags nohidden ~/Library/

# FINDER : Show Path/Status Bar, List view, extensions
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”
defaults write com.apple.finder ShowPathbar -bool true
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Find default folder to $HOME
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Quickview text selection
defaults write com.apple.finder QLEnableTextSelection -bool true

# No .DS_STORE on drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## DOCK Settings
# Minimum text size
defaults write com.apple.dock tilesize -int 39
# Magnification off
defaults write com.apple.dock magnification -bool false

# Ask Password right after save screen
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## HOT CORNERS
# TOP LEFT : Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# TOP RIGHT : - 
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0
# DOWN LEFT : Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# DOWN RIGHT : Screen Saver (Lock)
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Keyboard repetition delay
sudo defaults write NSGlobalDomain KeyRepeat -int 1
# Keystroke time delay
sudo defaults write NSGlobalDomain InitialKeyRepeat -int 10

## SHOW PERCENTAGE IN BATTERY STATUS
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

## ADD SOME APPS TO DOCK
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

## Restart Dock/Finder & Reboot
echo "Finder et Dock restarted... reboot necessary."
killall Dock
killall Finder

sudo reboot