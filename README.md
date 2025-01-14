# rcUtils

## Overview
rcUtils is an R library providing utility functions for parsing and analyzing log data.

## Features
  * logDetailsParseDQ: Parses data query log details into a structured format.
  * logDetailsParseRecord: Extracts key-value pairs from log details.
  * logDetailsParseRecordInstance: Extracts instance numbers from log details.
  * logFilter: Filters log actions based on specified types.
  * queryLogSummary: Summarizes query logs by extracting relevant information.

### queryLogSummary

## Installation
```r
# Install from GitHub
devtools::install_github("jubilee2/rcUtils")
```
## Usage
```R
library(rcUtils)

# Example log data
log <- data.frame(
  timestamp = Sys.time(),
  username = "user123",
  details = c(
    "Open data query",
    "Send data query back for further attention",
    "Open data query (Record: 1, Event: \"Event 1\")",
    "[instance = 123] name = 'Jane', age = '25', hobbies(2) = unchecked"
  )
)

# Summarize query logs
summary <- queryLogSummary(log)
print(summary)

# Parse log details
log$detailObj <- logDetailsParseRecord(log$details)
log$detailObj <- logDetailsParseDQ(log$details)

# Extract instance numbers
log$instance <- logDetailsParseRecordInstance(log$details)

# Filter log actions
types <- c("manage", "export")
selected <- logFilter(log$actions, types)
log[selected,]

```

## Documentation
For detailed documentation, visit our [Wiki](https://github.com/jubilee2/rcUtils/wiki).

## Contributing
Contributions are welcome! Please submit issues or pull requests on GitHub.

## License
`rcUtils` is licensed under the MIT License.
