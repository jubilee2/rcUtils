library(testthat)

test_that("logDataTransformer works with valid log data", {
  log <- data.frame(
    timestamp = as.POSIXct(c("2023-10-01 10:00:00", "2023-10-01 10:05:00", "2023-10-01 10:10:00", "2023-10-01 10:15:00")),
    username = c("user1", "user2", "user3", "user4"),
    action = c("Open data query", "Send data query back for further attention", "Open data query", "Update record"),
    record = c(1, 2, 3, 4),
    details = c(
      "name = 'John', age = '30'",
      "name = 'Jane', hobbies(1) = checked, age = '25', hobbies(2) = unchecked",
      "name = 'Alice', age = '28'",
      "[instance = 123] name = 'Bob', age = '35', hobbies(1) = checked"
    ),
    stringsAsFactors = FALSE
  )

  transformed_log <- logDataTransformer(log)

  expected <- data.frame(
    username = c("user1", "user1", "user2", "user2", "user2", "user2", "user3", "user3", "user4", "user4", "user4"),
    timestamp = as.POSIXct(c("2023-10-01 10:00:00", "2023-10-01 10:00:00", "2023-10-01 10:05:00", "2023-10-01 10:05:00", "2023-10-01 10:05:00", "2023-10-01 10:05:00", "2023-10-01 10:10:00", "2023-10-01 10:10:00", "2023-10-01 10:15:00", "2023-10-01 10:15:00", "2023-10-01 10:15:00")),
    action = c("Open data query", "Open data query", "Send data query back for further attention", "Send data query back for further attention", "Send data query back for further attention", "Send data query back for further attention", "Open data query", "Open data query", "Update record", "Update record", "Update record"),
    record = c(1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 4),
    instance = c(1, 1, 1, 1, 1, 1, 1, 1, 123, 123, 123),
    variable = c("name", "age", "name", "hobbies___1", "age", "hobbies___2", "name", "age", "name", "age", "hobbies___1"),
    value = c("John", "30", "Jane", "1", "25", "0", "Alice", "28", "Bob", "35", "1"),
    stringsAsFactors = FALSE
  )

  expect_equal(transformed_log, expected)
})

test_that("logDataTransformer works with empty log data", {
  log <- data.frame(
    timestamp = character(),
    username = character(),
    action = character(),
    record = character(),
    details = character(),
    stringsAsFactors = FALSE
  )

  transformed_log <- logDataTransformer(log)

  expected <- data.frame(
    username = character(),
    timestamp = character(),
    action = character(),
    record = character(),
    instance = character(),
    variable = character(),
    value = character(),
    stringsAsFactors = FALSE
  )

  expect_equal(transformed_log, expected)
})

test_that("logDataTransformer works with unparseable content", {
  log <- data.frame(
    timestamp = as.POSIXct("2023-10-01 10:00:00"),
    username = "user1",
    action = "Open data query",
    record = 1,
    details = "name = 'John', invalid_content",
    stringsAsFactors = FALSE
  )

  logDataTransformer(log) |> expect_warning("unparseable content")
})
