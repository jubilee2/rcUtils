\name{logDetailsParseDQ}
\alias{logDetailsParseDQ}
\title{Parse Data Query Log Details}
\description{
  Parse data query log details into a structured format.
}
\usage{
  logDetailsParseDQ(details)
}
\arguments{
  \item{details}{Character vector of log details}
}
\value{
  List of parsed log details
}
\examples{
  logDetailsParseDQ(c("Open data query (Record: 1, Event: \"Event 1\")"))
}
\seealso{
  \code{\link{logDetailsParseDQ}} for related functions
}
\keyword{utilities}