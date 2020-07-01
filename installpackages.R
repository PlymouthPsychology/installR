# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2020-06-29")

ncores <- parallel::detectCores()-1
install.packages(c('tidyverse', 'devtools'), lib="/usr/lib/R/site-library",  Ncpus=ncores)

library(tidyverse)
library(devtools)

minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)

utils::install.packages(minimal, lib="/usr/lib/R/site-library",  Ncpus=ncores)
utils::install.packages(suggested, lib="/usr/lib/R/site-library",  Ncpus=ncores)
utils::install.packages(bayes, lib="/usr/lib/R/site-library",  dependencies = T, Ncpus=ncores) # dependencies=T required for rstan

# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)
devtools::install_github('benwhalley/apastats',
    ref="343cbb3f0f37df0f6f54a0df351c98d9f17d5cbc",
    subdir='apastats', lib="/usr/lib/R/site-library")
