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

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get -y update

sudo apt-get install -y r-base-dev 
sudo apt-get install -y librsvg2-dev
sudo apt-get install -y libnlopt-dev # otherwise chokes when installing within R
sudo apt-get install -y libssl-dev 
sudo apt-get install -y libcurl4-openssl-dev 
sudo apt-get install -y libxml2-dev

sudo R --vanilla < packages-minimal.R
sudo R --vanilla < packages-others.R
sudo R --vanilla < check-versions.R

} # end the install function

# Now that we know the whole script has downloaded, run it.
_ "$0" "$@"