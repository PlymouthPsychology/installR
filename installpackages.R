# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2020-06-29")

ncores <- parallel::detectCores()-1


LIB_PATH="/usr/lib/R/site-library"
# LIB_PATH=.libPaths()[1]

install.packages('tidyverse', lib=LIB_PATH,  Ncpus=ncores)
install.packages('devtools', lib=LIB_PATH,  Ncpus=ncores)
install.packages('withr', lib=LIB_PATH,  Ncpus=ncores)


library(tidyverse)

minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)

library(devtools)
withr::with_libpaths(new = LIB_PATH, install_version('mnormt',version="1.5.7"))
utils::install.packages(x, lib=LIB_PATH, Ncpus=ncores)

install.packages('mnormt')

utils::install.packages(unique(c(minimal,suggested)), lib=LIB_PATH,  Ncpus=ncores)
utils::install.packages(bayes, lib=LIB_PATH,  dependencies = T, Ncpus=ncores) # dependencies=T required for rstan

# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)
devtools::install_github('benwhalley/apastats',
    ref="343cbb3f0f37df0f6f54a0df351c98d9f17d5cbc",
    subdir='apastats')

devtools::install_github('benwhalley/webex')



installed.packages()%>%as_tibble()%>% write_csv('installed_packages_output.csv')

install.packages('servr')
