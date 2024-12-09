
parseLogDetails <- function(details) {
  pairs <- strsplit(details, ",(?=[^']*(?:'[^']*'[^']*)*$)", perl = TRUE)

  pattern <- "(\\w+) = '(.*)'"
  pattern_checkbox <- "(\\w+)\\((\\d+)\\) = (unchecked|checked)"

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
        warning(paste("During parse logging details, encountered unparseable content:", pair))
      }
    }
    return(result)
  })
}

parseLogDetailsToInstance <- function(details) {
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
