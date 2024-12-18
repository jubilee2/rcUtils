\name{parseLogDetailsToInstance}
\alias{parseLogDetailsToInstance}
\title{Extract Instance Numbers from Log Details (Deprecated)}
\description{
Extracts instance numbers from log details.
Deprecation Notice
This function is deprecated since version 0.3.0. Use \code{logDetailsParseRecordInstance()} instead.
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
result <- logDetailsParseRecordInstance(log_details)
}
\seealso{
\code{logDetailsParseRecordInstance()}
}
\author{
Lynne & Jubilee
}
\deprecated{
Use \code{logDetailsParseRecordInstance()} instead.
}