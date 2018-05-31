#!/bin/bash

echo -e "Installing R and various other packages needed...\n\n"
echo -e "This may take some time: up to 1 hour in some cases\n\n"
echo "Please enter your computer password as required at the command prompt."
echo "You may need to do this several times before the install is complete."
sudo echo "..."

git clone https://github.com/PlymouthPsychology/plymuni-r-install
cd plymuni-r-install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install libxml2 openssl openssl librsvg libressl curl R
brew cask install rstudio

R --vanilla < packages.R
R --vanilla < check.R

echo "Installation complete"
open ~/Applications/RStudio.app 
