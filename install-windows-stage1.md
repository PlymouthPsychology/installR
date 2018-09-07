# Installing RStudio
_Ben Whalley and Andy Wills, June 2018._

These instructions are for **2018/19 Stage 1 undergraduate students** with a **Windows** computer.

## Before you start...
It's best to have had some experience of RStudio before trying to install it on your own machine, otherwise Step 3 probably won't make much sense. If you haven't yet completed the [Introduction to RStudio](http://www.willslab.org.uk/rminr/intro-rstudio.html), and [Exploring Data](http://www.willslab.org.uk/rminr/exploring-incomes.html) exercises, please do so now.

## How to install

**It's important to use the specific web links provided here**. If you use other links (e.g. those you might find with a Google search), you'll end up with a different version than the one we use for teaching. You may find this confusing. 

### Install R

R is the application that does all the hard sums in the background. We need to install this first:

a. Copy this address into your web browser to download R: https://cloud.r-project.org/bin/windows/base/old/3.5.0/R-3.5.0-win.exe

b. Wait for the download to finish (this may take a while, depending on the speed of your internet connection).

c. Click on 'save'.

d. Once downloaded, click on 'run'. 

e. Click 'yes' to "Do you wan to allow this app...".

f. Click 'OK', and then 'Next' repeatedly, and then 'Finish'.

### Install RStudio

RStudio is an application that allows us to use R more easily. We need to install this next:

a. Copy this address into your web browser to download RStudio: https://download1.rstudio.org/RStudio-1.1.383.exe

b. Wait for the download to finish (this may take a while, depending on the speed of your internet connection)

c. Click on 'save'.

d. Once downloaded, click on 'run'. 

e. Click 'yes' to "Do you want to allow this app...".

f. Click 'Next' repeatedly, then 'Install', and then 'Finish'.

### Install packages

_R_ has over 12,000 different _packages_, which allow us to do almost anything in _R_. For your Stage 1 courses, we just need the `tidyverse`, `effsize`, and `BayesFactor` packages. We'll install those now:

a. Run RStudio (it'll be on your 'Start' menu )

b. Run the following commands from the console window in RStudio:

```
options("repos" = "https://mran.microsoft.com/snapshot/2018-05-01")
minimal <- c("tidyverse", "effsize", "BayesFactor")
install.packages(minimal)
```

c. Wait for the packages to be installed. This will take **at least 7 minutes** -- longer unless your machine and internet connection are very fast.

### 4. That's it!

You're done. You should now have a working version of RStudio on your own machine that is the same as the one available on university machines.

____

This material is distributed under a [Creative Commons](https://creativecommons.org/) licence. CC-BY-SA 4.0.





