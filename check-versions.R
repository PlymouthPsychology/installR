library(tidyverse)

minimal <- read_csv("package-data/packages-minimal.csv") %>% pull(Package)
suggested <- read_csv("package-data/packages-suggested.csv") %>% pull(Package)
bayes <- read_csv("package-data/packages-bayes.csv") %>% pull(Package)
github <- read_csv("package-data/packages-github.csv") %>%
  separate(Package, into = c("acct", "Package")) %>%
  pull(Package)

intended <- read_csv("package-data/packages-frozen.csv")

problems <- installed.packages(fields = c("Version")) %>%
  as.tibble() %>%
  select(Package, Version) %>%
  filter(Package %in% c(minimal, suggested, bayes, github)) %>%
  left_join(intended, by = "Package") %>%
  filter(Version.x != Version.y)

if (problems %>% count() > 0) {
  warning("Some packages didn't match")
  problems %>%
    setNames(c("Package", "Installed", "Plymouth recommended version"))
} else {
  warning("All packages seem to have installed OK.")
}

