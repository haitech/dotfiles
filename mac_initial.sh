#!/bin/bash
# Just some basic setup for the mac.

# Brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load brew
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/thomas/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install PowerLevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Clear Mac dock
defaults write com.apple.dock persistent-apps -array

# Adjust mac keyboard key repeat
# InitialKeyRepeat, normal minimum is 15 (225 ms)
# KeyRepeat, normal minimum is 2 (30 ms)
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# Show Finder path
defaults write com.apple.finder ShowPathbar -bool true
killall Finder

# Set size mac docker
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock size-immutable -bool yes && killall Dock

# Install applications
brew install --cask google-chrome
brew install --cask rectangle
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify

brew install jesseduffield/lazygit/lazygit

brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

brew install nvim

echo "Remember to set ZSH_THEME="powerlevel10k/powerlevel10k into ~/.zshrc"
echo "Restart your Iterm2 once you added the theme."


git config --global pull.rebase true
git config --global diff.colorMoved zebra
