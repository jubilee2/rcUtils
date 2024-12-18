\name{parseLogDetails}
\alias{parseLogDetails}
\title{Parse Log Details (Deprecated)}
\description{
Parse log details into a list of key-value pairs.
Deprecation Notice
This function is deprecated since version 0.3.0. Use \code{logDetailsParseRecord()} instead.
}
\usage{
parseLogDetails(details)
}
\arguments{
\item{details}{Character string containing log details.}
}
\value{
A list of key-value pairs parsed from the log details.
}
\examples{
log_details <- "name = 'John', age = '30', hobbies(1) = checked"
parsed_details <- logDetailsParseRecord(log_details)
print(parsed_details)
}
\seealso{
\code{logDetailsParseRecord()}
}
\author{
Lynne & Jubilee
}
\note{
Use \code{logDetailsParseRecord()} instead.
}
