# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2020-06-29")

ncores <- parallel::detectCores()-1
install.packages('tidyverse', lib="/usr/lib/R/site-library",  Ncpus=ncores)

library(tidyverse)


minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)

library(devtools)
withr::with_libpaths(new = "/usr/lib/R/site-library/", install_version('mnormt',version="1.5.7"))
utils::install.packages(x, lib="/usr/lib/R/site-library", Ncpus=ncores)

utils::install.packages(unique(c(minimal,suggested)), lib="/usr/lib/R/site-library",  Ncpus=ncores)
utils::install.packages(bayes, lib="/usr/lib/R/site-library",  dependencies = T, Ncpus=ncores) # dependencies=T required for rstan

# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)
devtools::install_github('benwhalley/apastats',
    ref="343cbb3f0f37df0f6f54a0df351c98d9f17d5cbc",
    subdir='apastats', lib="/usr/lib/R/site-library")

devtools::install_github('benwhalley/webex',
        lib="/usr/lib/R/site-library")



installed.packages()%>%as_tibble()%>% write_csv('installed_packages_output.csv')
