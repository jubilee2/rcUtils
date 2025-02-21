\name{logDetailsParseRecord}
\alias{logDetailsParseRecord}
\title{Parse Log Details into Key-Value Pairs}
\description{
Parse log details into a list of key-value pairs, handling checkboxes and instance numbers.
}
\usage{
logDetailsParseRecord(details, output_format = "list")
}
\arguments{
\item{details}{Character string containing log details.}
\item{output_format}{Character string specifying the output format. Can be "list" or "data.frame". Default is "list".}
}
\value{
A list or data frame of key-value pairs parsed from the log details, depending on the specified output format.
}
\examples{
log_details <- "name = 'John', age = '30', hobbies(1) = checked"
parsed_details_list <- logDetailsParseRecord(log_details)
print(parsed_details_list)

parsed_details_df <- logDetailsParseRecord(log_details, output_format = "data.frame")
print(parsed_details_df)
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
