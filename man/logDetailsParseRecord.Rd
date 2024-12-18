\name{logDetailsParseRecord}
\alias{logDetailsParseRecord}
\title{Parse Log Details into Key-Value Pairs}
\description{
Parse log details into a list of key-value pairs, handling checkboxes and instance numbers.
}
\usage{
logDetailsParseRecord(details)
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
\code{logDetailsParseRecordInstance()}
}
\author{
Lynne & Jubilee
}
\note{
Replaces deprecated parseLogDetails() function.
}
