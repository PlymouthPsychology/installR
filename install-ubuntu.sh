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

# instructions from https://cran.rstudio.com/
# Here we use lsb_release -cs to access which Ubuntu flavor you run: one of “hirsuite”, “groovy”, “focal”, “bionic”
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt-get -y update

sudo apt-get install -y git
sudo apt-get install -y r-base
sudo apt-get install -y r-base-dev
sudo apt-get install -y librsvg2-dev
sudo apt-get install -y libnlopt-dev # otherwise chokes when installing within R
sudo apt-get install -y libssl-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y pandoc
sudo apt-get install -y libgsl-dev
sudo apt-get install -y libudunits2-dev
sudo apt-get install -y libgdal-dev
sudo apt-get install -y libxt-dev libgtk2.0-dev libcairo2-dev xvfb xauth xfonts-base

# note this will install latest packaged JAGS... see windows install intructions to match version exactly
# http://mcmc-jags.sourceforge.net
sudo apt-get install -y jags


git clone https://github.com/PlymouthPsychology/installR
cd installR

sudo R --vanilla < installpackages.R

} # end the install function

# Now that we know the whole script has downloaded, run it.
_ "$0" "$@"
