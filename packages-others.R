library(tidyverse)
library(devtools)

# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2018-05-01")

suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)
github <- read_csv("package-data/packages-github.csv")

utils::install.packages(suggested)
utils::install.packages(bayes, dependencies = T)

github %>%
  rowwise() %>%
  do(., install_github(.$Package, ref = .$commit))
