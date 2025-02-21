\name{logDataTransformer}
\alias{logDataTransformer}
\title{Transform Log Data into a Structured Data Frame}
\description{
Transforms log data into a structured data frame with columns: Username, timestamp, action, recordid, instance, variable, and value.
}
\usage{
logDataTransformer(logging)
}
\arguments{
\item{logging}{A data frame containing log data with columns: timestamp, username, action, record, and details.}
}
\value{
A data frame with columns: Username, timestamp, action, recordid, instance, variable, and value.
}
\examples{
# Example log data
log <- data.frame(
  timestamp = Sys.time(),
  username = "user123",
  action = c("Open data query", "Send data query back for further attention", "Open data query", "Update record"),
  record = c(1, 2, 3, 4),
  details = c(
    "Open data query",
    "Send data query back for further attention",
    "Open data query (Record: 1, Event: \"Event 1\")",
    "[instance = 123] name = 'Jane', age = '25', hobbies(2) = unchecked"
  ),
  stringsAsFactors = FALSE
)

# Transform log data
transformed_log <- logDataTransformer(log)
print(transformed_log)
}
\seealso{
\code{logDetailsParseRecord()}, \code{logDetailsParseRecordInstance()}
}
\author{
Lynne & Jubilee
}