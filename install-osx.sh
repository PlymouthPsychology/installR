#! /bin/bash

# we steal other things from here: https://install.sandstorm.io too
if test -z "$BASH_VERSION"; then
  echo "Please run this script using bash, not sh or any other shell." >&2
  exit 1
fi

# wrap the entire script in a big function which we only call at the very end
_() {

echo -e "Installing R and various other packages needed...\n\n"
echo -e "This may take some time: up to 1 hour in some cases\n\n"
echo "Please enter your computer password as required at the command prompt."
echo "You may need to do this several times before the install is complete."
sudo echo "..."

git clone https://github.com/PlymouthPsychology/installR
cd installR

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install libxml2 openssl openssl librsvg libressl R
brew cask install rstudio

# note, this will install the latest, but match plymouth install exactly see version specified in windows instructions
brew install jags


if test -z "$BASH_VERSION"; then
  echo "Please run this script using bash, not sh or any other shell." >&2
  exit 1
fi

R --vanilla < packages-minimal.R
R --vanilla < packages-others.R
R --vanilla < check-versions.R

echo "Installation complete"
open ~/Applications/RStudio.app 

}

# Now that we know the whole script has downloaded, run it.
_ "$0" "$@"
