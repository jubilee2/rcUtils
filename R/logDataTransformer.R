logDataTransformer <- function(logging) {
  # Parse log details
  logging$parsed_details <- logDetailsParseRecord(logging$details, output_format = "data.frame")
  logging$instance <- logDetailsParseRecordInstance(logging$details)
  
  # Initialize empty data frame with the required columns
  transformed_data <- data.frame(
    username = character(),
    timestamp = character(),
    action = character(),
    record = character(),
    instance = character(),
    variable = character(),
    value = character(),
    stringsAsFactors = FALSE
  )
  
  # Iterate over each log entry
  for (i in seq_along(logging$details)) {
    details_df <- logging$parsed_details[[i]]
    
    if (nrow(details_df) > 0) {
      # Create a data frame for the current log entry
      details_df$username <- logging$username[i]
      details_df$timestamp <- logging$timestamp[i]
      details_df$action <- logging$action[i]
      details_df$record <- logging$record[i]
      details_df$instance <- logging$instance[i]
      
      # Append the entry data frame to the transformed data
      transformed_data <- rbind(transformed_data, details_df)
    }
  }
  
  return(transformed_data[,c("username", "timestamp", "action", "record", "instance", "variable", "value")])
}