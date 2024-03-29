% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kerrich.R
\docType{data}
\name{kerrich}
\alias{kerrich}
\title{Kerrich Coin Toss Trial Outcomes}
\format{
A data frame with 1216 rows and 21 variables:
\describe{
  \item{id}{trial}
  \item{outcome}{outcome of each trial; TRUE = heads, FALSE = tails}
  \item{average}{cumulative mean of outcomes}
}
}
\source{
https://stats.stackexchange.com/questions/76663/john-kerrich-coin-flip-data/77044#77044

https://books.google.com/books/about/An_experimental_introduction_to_the_theo.html?id=JBTvAAAAMAAJ&hl=en
}
\usage{
data(kerrich)
}
\description{
A data set containing 2,000 trials of coin flips from statistician John Edmund Kerrich's 1940s
experiments while imprisoned by the Nazis during World War Two.
}
\examples{
str(kerrich)

if (require("ggplot2")) {
    ggplot(data = kerrich) +
        geom_hline(mapping = aes(yintercept = .5, color = "p(heads)")) +
        geom_line(mapping = aes(x = id, y = average)) +
        ylim(0,1)
}

}
\references{
https://en.wikipedia.org/wiki/John_Edmund_Kerrich
}
\keyword{datasets}
