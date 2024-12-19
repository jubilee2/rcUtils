queryLogSummary <- function(logs) {
  # Parse the log details for data quality
  parsedDetails <- logDetailsParseDQ(logs$details)

  # Function to extract a specific field from a list of details
  # details: list of parsed log details
  # field: the field to extract from each detail
  applyExtractField <- function(details, field) {
    vapply(details, function(x) ifelse(is.null(x[[field]]), NA_character_, x[[field]]), FUN.VALUE = character(1))
  }

  logs$Action <- applyExtractField(parsedDetails, "Action")
  logs$Record <- applyExtractField(parsedDetails, "Record")
  logs$Event <- applyExtractField(parsedDetails, "Event")
  logs$Field <- applyExtractField(parsedDetails, "Field")
  logs$Comment <- applyExtractField(parsedDetails, "Comment")
  logs$`Data Quality Rule` <- applyExtractField(parsedDetails, "Data Quality Rule")

  selector <- sapply(parsedDetails, length) > 0
  logs[selector,c("timestamp", "username", "Action","Record","Event","Field","Data Quality Rule","Comment")]
}
