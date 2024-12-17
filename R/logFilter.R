#' Filter log actions based on specified types
#'
#' @param actions Character vector of log actions
#' @param types Character vector of types to filter by (or 'all' for all types)
#' @return Logical vector indicating whether each action matches the specified types

logFilter <- function(actions, types = c()) {
  # Validate input
  if (!is.character(actions)) {
    stop("actions must be a character vector")
  }
  if (!is.character(types)) {
    stop("types must be a character vector")
  }

  # Define type mappings
  type_mappings <- list(
    manage = "^Manage/Design$",
    export = c("^Data export", "^PDF Export with data Record"),
    user = c("^(Add|Update|Delete) user ", "^(Create|Edit|Delete) user role", "^User assigned to role", "^User removed"),
    record_add = "^Create (record|Response)",
    record_edit = "^Update (record|Response)",
    record_delete = "^Delete (record|Response)",
    record = c("^(Create|Update|Delete) (record|Response)", "Update record"),
    lock_record = "^Lock/Unlock Record",
    page_view = "^Page View "
  )

  if (any(types == 'all')) {
    types <- names(type_mappings)
  }

  # Initialize result
  result <- logical(length(actions))

  # Iterate over types
  for (t in types) {
    if (t %in% names(type_mappings)) {
      patterns <- type_mappings[[t]]
      for (pattern in patterns) {
        result <- result | grepl(pattern, actions, ignore.case = TRUE)
      }
    } else {
      stop(paste0("Unsupported type: '", t, "'"))
    }
  }

  # Handle NA actions
  result[is.na(actions)] <- FALSE

  return(result)
}
