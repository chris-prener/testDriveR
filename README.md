
<!-- README.md is generated from README.Rmd. Please edit that file -->

# testDriveR <img src="man/figures/logo.png" align="right" />

[![Travis-CI Build
Status](https://travis-ci.org/chris-prener/testDriveR.svg?branch=master)](https://travis-ci.org/chris-prener/testDriveR)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/chris-prener/testDriveR?branch=master&svg=true)](https://ci.appveyor.com/project/chris-prener/testDriveR)
[![DOI](https://zenodo.org/badge/95270521.svg)](https://zenodo.org/badge/latestdoi/95270521)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/testDriveR)](https://cran.r-project.org/package=testDriveR)

The goal of `testDriveR` is to provide data sets for teaching statistics
and data science courses. These are data that I use for teaching
[SOC 4015 / SOC 5050](https://slu-soc5050.github.io) at [Saint Louis
University](https://slu.edu).

## Installation

`testDriveR` is not available from CRAN yet. In the meantime, you can
install the development version of `testDriveR` from
[Github](https://github.com/chris-prener/testDriveR) with `remotes`:

``` r
# install.packages("remotes")
remotes::install_github("chris-prener/testDriveR")
```

## Current Data

The package currently contains three data tables:

  - `auto17` - A data set containing model year 2017 vehicles for sale
    in the United States
  - `childMortality` - A data set containing childhood mortality time
    series data by country from UNICEF
  - `gss14` - A data set containing a selection of variables related to
    work and education from the 2016 General Social Survey
  - `gss14_simple` - A simple version of `gss14` without factors created
    and without missing data explicitly declared
  - `kerrich` - A data set containing 2000 trials of coin flips by John
    Edmund Kerrich

## Useage

Once loaded, the data contained in `testDriveR` can be loaded into data
frames in your global environment and then explored. For example, to
load the `auto17` data:

``` r
library("testDriveR")
autoData <- auto17
str(autoData)
```

## Data Creation

If you are interested in the original data/code used to create the
included data, you can find them at:

  - `auto17` is documented in [Chris’s `autoData`
    repository](https://github.com/chris-prener/autoData)
  - `childMortality` is documented in [Chris’s `childMortality`
    repository](https://github.com/chris-prener/childMortality)
  - `gss14` and `gss14_simple` are documented in [Chris’s `gss14`
    repository](https://github.com/chris-prener/gss14)
  - `kerrich` is documented in the [`extdata`
    directory](/inst/extdata/kerrich.R)

## Contributor Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.
