library(tidyverse)

minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)
github <- read_csv("package-data/packages-github.csv") %>%
  separate(Package, into = c("acct", "Package")) %>%
  pull(Package)

installed.packages(fields = c("Version")) %>%
  tibble::as.tibble() %>%
  select(Package, Version) %>%
  filter(Package %in% c(minimal, suggested, github)) %>%
  write_csv("package-data/packages-frozen.csv")

