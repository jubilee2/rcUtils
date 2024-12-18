\name{queryLogSummary}
\alias{queryLogSummary}
\title{Summarize Data Query Logs}
\description{
Summarize query logs by extracting relevant information from log details.
}
\usage{
queryLogSummary(logs)
}
\arguments{
\item{logs}{Data frame containing query logs with a 'timestamp', 'username', 'details' column.}
}
\value{
Data frame with summarized query log information.
}
\examples{
logs <- data.frame(
timestamp = Sys.time(),
username = "user123",
details = c("Open data query", "Send data query back for further attention")
)
summary <- queryLogSummary(logs)
print(summary)
}
\seealso{
\code{logDetailsParseDQ()}
}
\author{
Jubilee
}
