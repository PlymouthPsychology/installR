
# Installation instructions for Windows


These instructions are for a complete install, matching the R packages and setup on the University systems.

If you only need a simple installation you can skip steps 3, 5, 7, 8 and 9.



# 1

Download the `installR` project file from: https://github.com/PlymouthPsychology/installR/archive/master.zip 

Expand the package. 

Open the new (expanded) folder.


# 2

Install the R Base System from: https://cloud.r-project.org/bin/windows/base/R-3.4.4-win.exe

Use this version (and not a more recent one) if you want to be sure of compatibility with the University installed versions.

Accept all installer defaults.



# 3

Install Rtools:

https://cloud.r-project.org/bin/windows/Rtools/Rtools34.exe

Accept all the installer defaults. Be sure to click the checkbox to "add to system PATH". 

This is important and some packages (Stan) won't work without it. (see https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Windows#toolchain)



# 4

Install RStudio from:  https://download1.rstudio.org/RStudio-1.1.383.exe

Accept all installer defaults



# 5 

Run the following snippet of R code:


```
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) 
  dir.create(dotR)
  
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) 
  file.create(M)
cat("\nCXXFLAGS=-O3 -Wno-unused-variable -Wno-unused-function", 
    file = M, sep = "\n", append = TRUE)


cat('Sys.setenv(BINPREF = "C:/Rtools/mingw_$(WIN)/bin/")',
    file = file.path(Sys.getenv("HOME"), ".Rprofile"), 
    sep = "\n", append = TRUE)
```


Note: If you are installing on a multi-user system (or for TIS, when installing on the university-wide image) make sure to execute the following R code for each individual user. This needs to be run such that each user gets the changes made to the RProfile.




# 6

Install the minimal set of R packages by opening and running `packages-minimal.R` (e.g. from inside RStudio).



# 7

You can install other recommended packages by running `packages-others.R`.

(Note: If you already had RStudio open, quit it and then reopen before running this).





# 8

Install Tex to allow RMarkdown documents to be built:

First use the net installer to download the install files:

Run https://anorien.csc.warwick.ac.uk/mirrors/CTAN/systems/win32/miktex/setup/windows-x64/setup-2.9.6637-x64.exe

- Accept conditions
- Choose 'download'
- Choose 'complete MikTex'
- Choose a download mirror — any will work, but I chose Warwick anorien using HTTPS (not ftp)
- Accept defaults and choose install. This will take some time to download.


Then run the installer again, 

- choose 'install' not 'download'
- choose the files previously downloaded into the users' directory
- choose complete
- select defaults and execute


To check the Tex install and everything works, open the check-packages.Rmd file and press 'Knit'. This should output a pdf.




# 10 Install JAGS (specific to school of Mathematics and Statistics)

Install JAGS using the installer hosted at: <https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Windows/JAGS-4.3.0.exe/download>

For more info see: http://mcmc-jags.sourceforge.net





