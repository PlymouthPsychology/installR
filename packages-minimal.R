# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2020-06-29")
minimal <- read.csv("package-data/packages-minimal.csv", stringsAsFactors = F)$Package

ncores <- parallel::detectCores()-1

update.packages()
utils::install.packages(minimal, Ncpus=ncores, quiet=T)
