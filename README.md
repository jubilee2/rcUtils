# rcUtils

## Overview
rcUtils is an R library providing utility functions for parsing and analyzing log data. It includes:

## Functions
### parseLogDetails
Extracts key-value pairs from log details.
### parseLogDetailsToInstance
Extracts instance numbers from log details.

## Installation
```R
# Install from GitHub
devtools::install_github("jubilee2/rcUtils")
```

## Usage
```R
library(rcUtils)

# Example log data
log <- data.frame(
  details = c(
    "name = 'John', age = '30', hobbies(1) = checked",
    "[instance = 123] name = 'Jane', age = '25', hobbies(2) = unchecked"
  )
)

# Parse log details
log$detailObj <- parseLogDetails(log$details)

# Extract instance numbers
log$instance <- parseLogDetailsToInstance(log$details)

```
## Features
  * parseLogDetails: Extracts key-value pairs from log details.
  * parseLogDetailsToInstance: Extracts instance numbers from log details.

## Contributing
Contributions are welcome! Please submit issues or pull requests on GitHub.

## License
`rcUtils` is licensed under the MIT License.
