## Release summary
This is an update that adds an R markdown template for use by my students and others using the package.

## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on Travis CI), R-release, R-oldrel, R-devel
* macOS (on Travis CI), R-release, R-oldrel
* windows i386 (on Appveyor), R-release, R-oldrel, R-devel
* windows x64 (on Appveyor), R-release, R-oldrel, R-devel
* winbuilder, R-release, R-devel
* r-hub, Windows Server 2008 R2 SP1, R-devel, 32/64 bit
* r-hub, Ubuntu Linux 16.04 LTS, R-release, GCC
* r-hub, Fedora Linux, R-devel, clang, gfortran

## R CMD check results
* There were no ERRORs, WARNINGs, or NOTEs with local checks or on Travis CI/Appveyor.

* winbuilder and r-hub identified several words that may be misspelled in the `DESCRIPTION` file - all are correct.
* winbuilder and r-hub, R-release both have a note about issues coverting the ORCID ID to a URL

## Reverse dependencies
Not applicable.

## Changes
* no substantive changes to any existing functionality (aside for addressing typos in documentation)
* added the R Markdown template for my students
