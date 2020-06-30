library(tidyverse)
library(devtools)

# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2020-06-29")

suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)
#mathsstats <- read_csv("package-data/packages-maths-stats.csv") %>% pull(Package)
#github <- read_csv("package-data/packages-github.csv")

utils::install.packages(suggested)

# dependencies=T required for rstan
utils::install.packages(bayes, dependencies = T)
utils::install.packages(mathsstats)


# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)

devtools::install_github('benwhalley/apastats',
    ref="343cbb3f0f37df0f6f54a0df351c98d9f17d5cbc",
    subdir='apastats')
