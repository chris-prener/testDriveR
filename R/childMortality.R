#' UNICEF Childhood Mortality Data
#'
#' A data set containing time series data by country for estimated under-5, infant, and neonatal mortality rates.
#'
#' @docType data
#'
#' @usage data(childMortality)
#'
#' @format A data frame with 28982 rows and 6 variables:
#' \describe{
#'   \item{countryISO}{two-letter country code}
#'   \item{countryName}{full name of country}
#'   \item{continent}{name of continent}
#'   \item{category}{type of mortality rate - \code{infant_MR}, \code{child_MR}, or \code{under5_MR}}
#'   \item{year}{year of estimate}
#'   \item{estimate}{estimated mortality rate}
#' }
#'
#' @source https://childmortality.org
#'
#' @examples
#' str(childMortality)
#'
"childMortality"
