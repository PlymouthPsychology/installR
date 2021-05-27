# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2021-05-25")

ncores <- parallel::detectCores()-1
LIB_PATH="/usr/lib/R/site-library"
# LIB_PATH=.libPaths()[1]

install.packages('tidyverse', lib=LIB_PATH,  Ncpus=ncores)
install.packages('devtools', lib=LIB_PATH,  Ncpus=ncores)
install.packages('withr', lib=LIB_PATH,  Ncpus=ncores)

library(tidyverse)
library(devtools)

minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)

utils::install.packages(unique(c(minimal,suggested)), lib=LIB_PATH,  Ncpus=ncores)

# Need to do rstan manually because it's so fussy, sigh.
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
# install.packages("V8")
install.packages('rstan', lib=LIB_PATH, repos = 'https://cloud.r-project.org/', dependencies = TRUE)
install.packages('shinystan', lib=LIB_PATH, repos = 'https://cloud.r-project.org/', dependencies = TRUE)

utils::install.packages(bayes, lib=LIB_PATH,  dependencies = T, Ncpus=ncores) # dependencies=T required for rstan

# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)
devtools::install_github('benwhalley/apastats',
    ref="44cf600ce2db186705c323276e523e11a610c0f0",
    subdir='apastats')

devtools::install_github('benwhalley/webex')

installed.packages()%>%
  as_tibble() %>%
  write_csv('installed_packages_output.csv')

rmarkdown::render('test.Rmd')
