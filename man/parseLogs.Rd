\name{parseLogDetails}
\alias{parseLogDetails}
\title{Parse Log Details}
\description{
  Parse log details into a list of key-value pairs.
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
  # Example usage
  log_details <- "name = 'John', age = '30', hobbies(1) = checked"
  parsed_details <- parseLogDetails(log_details)
  print(parsed_details)
}
\seealso{
  # Optional: related functions or packages
}
\author{
  Lynne & Jubilee
}
\note{
  # Optional: additional notes or warnings
}
