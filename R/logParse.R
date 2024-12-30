
logDetailsParseRecord <- function(details) {
  pairs <- strsplit(details, "(?<='| = unchecked| = checked), (?=[\\w]+ = '|[\\w()]+ = )", perl = TRUE)

  pattern <- "^(\\w+) = '(.*)'$"
  pattern_checkbox <- "^(\\w+)\\((\\d+)\\) = (unchecked|checked)$"

  lapply(pairs, function(row_pairs){
    # Initialize empty list
    result <- list()

    # Iterate over pairs and populate list
    for (pair in row_pairs) {
      if (grepl(pattern_checkbox, pair)) {
        key <- sub(pattern_checkbox, "\\1___\\2", pair)
        value <- sub(pattern_checkbox, "\\3", pair)

        value <- gsub("unchecked", "0", value)
        value <- gsub("checked", "1", value)

        key <- gsub("^\\s+|\\s+$", "", key)
        value <- gsub("^\\s+|\\s+$", "", value)

        result[[key]] <- value
      } else if(grepl(pattern, pair)) {
        key <- sub(pattern, "\\1", pair)
        value <- sub(pattern, "\\2", pair)

        key <- gsub("^\\s+|\\s+$", "", key)
        value <- gsub("^\\s+|\\s+$", "", value)

        result[[key]] <- value
      } else if(grepl("(Erase all data|\\[instance = \\d+\\]|\\[Erase survey responses and start survey over\\])", pair)) {
      } else {
        warning(paste('In function logDetailsParseRecord: encountered unparseable content: "', pair, '"'))
      }
    }
    return(result)
  })
}

logDetailsParseRecordInstance <- function(details) {
  pattern <- "\\[instance = (\\d+)\\]"

  lapply(details, function(row_details){
    if (grepl(pattern, row_details)) {
      return(sub(pattern, "\\1", regmatches(row_details, gregexpr(pattern, row_details))[[1]]))
    }
    else{
      return('1')
    }
  })
}

logDetailsParseDQ <- function(details) {
  dq_log_selector <- grepl("^(Open|Respond to|Send|Close) data query", details)

  pattern <- ',\\s(?=(?:[^"]|"[^"]*")*$)'

  actions <- sub("\\s?\\(.*$", "", details)
  info <- gsub("^[^\\(]+\\(|\\)$", "", details)
  info <- paste0("Action: ", actions, ", ", info)
  info[!dq_log_selector] <- ''
  pairs <- strsplit(info, pattern, perl = TRUE)

  lapply(pairs, function(x) {
    if (length(x) == 1 && x == "") {
      return(list())
    }

    # Split the string by ': ' but only if it is not inside quotes
    kv <- strsplit(x, ': (?=(?:[^"]|"[^"]*")*$)', perl = TRUE)
    kv <- lapply(kv, function(x) gsub('^"|"$', "", x))

    as.list(setNames(
      unlist(lapply(kv, "[", 2)),
      unlist(lapply(kv, "[", 1))
    ))
  })
}
