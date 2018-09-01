## Release summary
This is the re-resubmission of the initial CRAN submission. Based on the reviewer's (Uwe Ligges) feedback, I have altered the package description in the `DESCRIPTION` file and fixed the broken URL in `man/testDriveR.Rd`. Thanks,
Uwe, for your review and your feedback.

## Test environments
* local OS X install, R 3.5.1
* ubuntu 14.04 (on Travis CI), R-release, R-oldrel, R-devel
* macOS (on Travis CI), R-release, R-oldrel
* windows i386 (on Appveyor), R-release, R-oldrel, R-devel
* windows x64 (on Appveyor), R-release, R-oldrel, R-devel
* winbuilder, R-devel

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local checks or on Travis CI/Appveyor.

On devtools::release()'s R CMD check we get one NOTE:

 * checking CRAN incoming feasibility ... NOTE

   This notes that the package is a new submission. 

## Reverse dependencies
Not applicable.
