\name{parseLogDetailsToInstance}
\alias{parseLogDetailsToInstance}
\title{Extract Instance Numbers from Log Details}
\description{
  Extracts instance numbers from log details.
}
\usage{
  parseLogDetailsToInstance(details)
}
\arguments{
  \item{details}{A character vector containing log details.}
}
\value{
  A character vector of instance numbers parsed from the log details.
}
\examples{
  log_details <- "[instance = 123] name = 'John', age = '30'"
  result <- parseLogDetailsToInstance(log_details)
}
