# Plymouth University Recommended R installation

This repo contains details for the recommended installation of R at Plymouth University.



## Packaging and versions


We use MRAN to install timestamped versions of packages. The current cutoff date is `2018-07-01`.

The university image is updated each year over the summer, and a new release made here. If you'd like to request that an additional package be added, file an issue. Please don't include package dependencies in this list unless they are required in their own right (i.e. don't just dump the output of `installed_packages()`).



## Installation

Following these instructions will come close to replicating the installation found on the campus-wide Windows installation, and should mitigate any problems you have with your code (or make resolving them easier).


### Windows

Windows users should follow the instructions at `install_windows.md`.



### OS X

OS X users can run the following script from the command line:

```
curl https://raw.githubusercontent.com/PlymouthPsychology/installR/master/install-osx.sh | bash
```


### Linux (Ubuntu)

Ubuntu users can run the following script from the command line:


```
curl https://raw.githubusercontent.com/PlymouthPsychology/installR/master/install-ubuntu.sh | bash
```


