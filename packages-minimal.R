# Set the CRAN repo to a specific date to effectively snapshop and
# avoid compatibility issues.
options("repos" = "https://mran.microsoft.com/snapshot/2018-05-01")

minimal <- read.csv("package-data/packages-minimal.csv", stringsAsFactors = F)$Package
utils::install.packages(minimal)
