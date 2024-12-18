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
Replaces deprecated \code{parseLogDetails()} function.
}
Details
This function splits log details into pairs using regular expressions, then iterates over pairs to extract keys and values. It handles checkboxes by converting "unchecked" and "checked" to 0 and 1, respectively.
Return Value
A list of key-value pairs, where keys are character strings and values are character strings or numeric values (for checkboxes).
Warnings
If unparseable content is encountered, a warning is issued with the problematic content.
Replacement for
\code{parseLogDetails()} (deprecated since version 0.3.0)