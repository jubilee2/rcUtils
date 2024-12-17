\name{logFilter}
\alias{logFilter}
\title{Filter Log Actions}
\description{
  Filter log actions based on specified types.

  This function takes a character vector of log actions and a character vector of types.
  It returns a logical vector indicating whether each action matches the specified types.
}
\usage{
logFilter(actions, types = c())
}
\arguments{
  \item{actions}{Character vector of log actions.}
  \item{types}{Character vector of types to filter by (or 'all' for all types).}
}
\value{
  Logical vector indicating whether each action matches the specified types.
}
\examples{
  actions <- c("Manage/Design", "Data export", "Create record")
  types <- c("manage", "export")
  logFilter(actions, types)
}
\seealso{
  \code{\link{grepl}} for pattern matching.
}
\keyword{utilities}
