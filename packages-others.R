library(tidyverse)
library(devtools)

# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2019-07-01")

suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)
mathsstats <- read_csv("package-data/packages-maths-stats.csv") %>% pull(Package)
github <- read_csv("package-data/packages-github.csv")

utils::install.packages(suggested)

# dependencies=T required for rstan
utils::install.packages(bayes, dependencies = T)
utils::install.packages(mathsstats)


# these github packages are also needed and not on cran
# note commit ref to snapshot at specific release (more secure)

devtools::install_github('achetverikov/apastats', 
    ref="bad9b3b51869d94fa870bf63209d86cbaadd2bd4", 
    subdir='apastats')

devtools::install_github('hadley/multidplyr', 
    ref="51b772f980efe936233d97a6f0dd61543b3b7818")
