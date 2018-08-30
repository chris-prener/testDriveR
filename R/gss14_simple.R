#' 2014 General Social Survey (Simplified)
#'
#' @description A data set containing data on work, salary, and education from the 2014 General
#' Social Survey. Missing data are not explicitly identified with NAs and all data are
#' represented numerically instead of as factors when appropriate.
#'
#' @docType data
#'
#' @usage data(gss14_simple)
#'
#' @format A data frame with 2538 rows and 19 variables:
#' \describe{
#'   \item{YEAR}{GSS year for this respondent}
#'   \item{INCOME06}{Total family income (2006 version)}
#'   \item{INCOM16}{Rs family income when 16 yrs old}
#'   \item{REG16}{Region of residence, age 16}
#'   \item{RACE}{Race of respondent}
#'   \item{SEX}{Respondents sex}
#'   \item{SPDEG}{Spouses highest degree}
#'   \item{MADEG}{Mothers highest degree}
#'   \item{PADEG}{Fathers highest degree}
#'   \item{DEGREE}{Rs highest degree}
#'   \item{CHILDS}{Number of children}
#'   \item{SPWRKSLF}{Spouse self-emp. or works for somebody}
#'   \item{SPHRS1}{Number of hrs spouse worked last week}
#'   \item{MARITAL}{Marital status}
#'   \item{WRKSLF}{R self-emp or works for somebody}
#'   \item{HRS1}{Number of hours worked last week}
#'   \item{WRKSTAT}{Labor force status}
#'   \item{ID_}{Respondent id number}
#'   \item{BALLOT}{Ballot used for interview}
#' }
#'
#' @source https://gssdataexplorer.norc.org
#'
#' @examples
#' str(gss14_simple)
#' head(gss14_simple)
#'
"gss14_simple"
