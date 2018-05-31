
# Installation instructions for Windows


These instructions are for a complete install, matching the R packages installed on the University systems.

If you only need a minimal installation you can skip many of the steps: just do step 0, 1,and 6. 




# 0

Download the installR project file from: https://github.com/PlymouthPsychology/installR/archive/master.zip and expand the package. Open the new (expanded) folder.


# 1 
Install R Base:
https://cloud.r-project.org/bin/windows/base/R-3.4.4-win.exe
Accept all installer defaults, except uncheck make desktop icon



# 2
Install Rtools:
https://cloud.r-project.org/bin/windows/Rtools/Rtools34.exe

Accept defaults, but see notes in page github link here https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Windows#toolchain  about clicking checkbox to add to system PATH. 
THIS IS IMPORTANT AND STAN WON'T WORK WITHOUT IT

See https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Windows#r


# 3

Install Rstudio:
https://download1.rstudio.org/RStudio-1.1.383.exe
Accept all installer defaults



# 4 

Execute the following R code FOR EACH USER INDIVIDUALLY. This needs to be run such that each user gets a copy of it... or at least gets a copy of it made in their home directory:


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



# 5 
Install Rstan by running this R code in RStudio:

install.packages("rstan", dependencies=TRUE)
install.packages("rstanarm")


Check all is OK by running this R code in RStudio:

```
fx <- inline::cxxfunction( signature(x = "integer", y = "numeric" ) , '
	return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
' )
fx( 2L, 5 ) # should be 10

```



# 6 

Install other R packages by opening and running `packages-minimal.R` and `packages-others.R` in RStudio. BE SURE TO QUIT RSTUDIO FIRST THOUGH AND DON"T SAVE THE WORKSPACE WHEN PROMPTED


Run `check-versions.R`




# 7 

Install Tex to allow RMarkdown documents to be built:

First use the net installer to download the install files:

Run https://anorien.csc.warwick.ac.uk/mirrors/CTAN/systems/win32/miktex/setup/setup-2.9.6406-x64.exe

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




# 8 

To check the Tex install and everything works, open the check-packages.Rmd file and press 'Knit'. This should output a pdf (which you could send me to check, or compare with the version I sent. You might have to quit Rstudio and reopen it first.







