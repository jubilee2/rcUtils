\name{logDetailsParseRecordInstance}
\alias{logDetailsParseRecordInstance}
\title{Extract Instance Numbers from Log Details}
\description{
Extract instance numbers from log details, defaulting to 1 if not found.
}
\usage{
logDetailsParseRecordInstance(details)
}
\arguments{
\item{details}{Character vector containing log details.}
}
\value{
A character vector of instance numbers parsed from the log details.
}
\examples{
log_details <- c("[instance = 123] name = 'John', age = '30'", "name = 'Jane', age = '25'")
instance_numbers <- logDetailsParseRecordInstance(log_details)
print(instance_numbers)
}
\seealso{
\code{logDetailsParseRecord()}
}
\author{
Lynne & Jubilee
}
\note{
Replaces deprecated parseLogDetailsToInstance() function.
}
