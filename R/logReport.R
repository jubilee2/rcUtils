queryLogSummary <- function(logs) {
  # Function implementation
  o <- logDetailsParseDQ(logs$details)
  logs$Action <- sapply(o, function(x) if (is.null(x$Action)) NA else x$Action)
  logs$Record <- sapply(o, function(x) if (is.null(x$Record)) NA else x$Record)
  logs$Event <- sapply(o, function(x) if (is.null(x$Event)) NA else x$Event)
  logs$Field <- sapply(o, function(x) if (is.null(x$Field)) NA else x$Field)
  logs$Comment <- sapply(o, function(x) if (is.null(x$Comment)) NA else x$Comment)
  logs$`Data Quality Rule` <- sapply(o, function(x) if (is.null(x$`Data Quality Rule`)) NA else x$`Data Quality Rule`)

  selector <- sapply(o, length) > 0
  logs[selector,c("timestamp", "username", "Action","Record","Event","Field","Data Quality Rule","Comment")]
}
