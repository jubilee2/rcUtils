# test-parseLogs.R

# Test case 1: Simple key-value pair
test_that("logDetailsParseRecord works for simple key-value pair", {
  test_details <- "name = 'John', age = '30', foo = 'ii'i'"
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list(name = "John", age = "30", foo = "ii'i")
  expect_equal(result, expected)
})

# Test case 2: Checkbox key-value pair
test_that("logDetailsParseRecord works for checkbox key-value pair", {
  test_details <- "hobbies(1) = checked, hobbies(2) = unchecked"
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list(hobbies___1 = "1", hobbies___2 = "0")
  expect_equal(result, expected)
})

# Test case 3: Mixed key-value pairs
test_that("logDetailsParseRecord works for mixed key-value pairs", {
  test_details <- "name = 'Jane', hobbies(1) = checked, age = '25', foo = 'ii'i', hobbies(2) = unchecked"
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list(name = "Jane", hobbies___1 = "1", age = "25", foo = "ii'i", hobbies___2 = "0")
  expect_equal(result, expected)
})

# Test case 4: Unparseable content
test_that("logDetailsParseRecord warns for unparseable content", {
  test_details <- "name = 'Bob', invalid_content"
  expect_warning(logDetailsParseRecord(test_details), "unparseable content")
})

test_that("logDetailsParseRecord handles trailing comma", {
  test_details <- "name = 'John', age = '30',"
  expect_warning(result<-logDetailsParseRecord(test_details), "unparseable content")
})

# Test case 5: Empty input
test_that("logDetailsParseRecord returns empty list for empty input", {
  test_details <- ""
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list()
  expect_equal(result, expected)
})

####

# Test case 1: Details with instance number
test_that("logDetailsParseRecordInstance extracts instance number", {
  test_details <- c("[instance = 123]", "[instance = 456]")
  result <- logDetailsParseRecordInstance(test_details)[[1]]
  expect_equal(result, '123')
})

# Test case 2: Details without instance number
test_that("logDetailsParseRecordInstance returns '1' for no instance number", {
  test_details <- c("No instance number")
  result <- logDetailsParseRecordInstance(test_details)[[1]]
  expected <- "1"
  expect_equal(result, expected)
})

# Test case 3: Multiple details with and without instance number
test_that("logDetailsParseRecordInstance handles multiple details", {
  test_details <- c("[instance = 789]", "No instance number", "[instance = 1011]")
  result <- logDetailsParseRecordInstance(test_details)
  expected <- list("789", "1", "1011")
  expect_equal(result, expected)
})

# Test case 4: Empty details
test_that("logDetailsParseRecordInstance returns '1' for empty details", {
  test_details <- c("")
  result <- logDetailsParseRecordInstance(test_details)
  expected <- list("1")
  expect_equal(result, expected)
})

# Test case 5: NA details
test_that("logDetailsParseRecordInstance returns '1' for NA details", {
  test_details <- c(NA)
  result <- logDetailsParseRecordInstance(test_details)
  expected <- list("1")
  expect_equal(result, expected)
})



# Test case 1: Valid data query
test_that("logDetailsParseDQ parses valid data query", {
  test_details <- c('Open data query (Record: 1, Event: "Event 1")')
  result <- logDetailsParseDQ(test_details)
  expected <- list(
    list(
      Action = "Open data query",
      Record = "1",
      Event = "Event 1"
    )
  )
  expect_equal(result, expected)
})

# Test case 2: Multiple valid data queries
test_that("logDetailsParseDQ parses multiple valid data queries", {
  test_details <- c(
    "Open data query (Record: 1, Event: \"Event 1\")",
    "Respond to data query (Record: 2, Event: \"Event 2\")"
  )
  result <- logDetailsParseDQ(test_details)
  expected <- list(
    list(
      Action = "Open data query",
      Record = "1",
      Event = "Event 1"
    ),
    list(
      Action = "Respond to data query",
      Record = "2",
      Event = "Event 2"
    )
  )
  expect_equal(result, expected)
})

# Test case 3: Invalid data query
test_that("logDetailsParseDQ returns empty list for invalid data query", {
  test_details <- c("Invalid log message")
  result <- logDetailsParseDQ(test_details)
  expected <- list(list())
  expect_equal(result, expected)
})

# Test case 4: NA details
test_that("logDetailsParseDQ returns empty list for NA details", {
  test_details <- c(NA)
  result <- logDetailsParseDQ(test_details)
  expected <- list(list())
  expect_equal(result, expected)
})

# Test case 5: Empty string
test_that("logDetailsParseDQ returns empty list for empty string", {
  test_details <- c("")
  result <- logDetailsParseDQ(test_details)
  expected <- list(list())
  expect_equal(result, expected)
})

# Test case 6: Edge case - quoted value
test_that("logDetailsParseDQ handles quoted values", {
  test_details <- c("Open data query (Record: 1, Event: \"Event 1, with comma\")")
  result <- logDetailsParseDQ(test_details)
  expected <- list(
    list(
      Action = "Open data query",
      Record = "1",
      Event = "Event 1, with comma"
    )
  )
  expect_equal(result, expected)
})

# Test case 7: Edge case - multiple quoted values
test_that("logDetailsParseDQ handles multiple quoted values", {
  test_details <- c("Open data query (Record: 1, Event: \"Event 1, with comma\", Description: \"Desc 1\")")
  result <- logDetailsParseDQ(test_details)
  expected <- list(
    list(
      Action = "Open data query",
      Record = "1",
      Event = "Event 1, with comma",
      Description = "Desc 1"
    )
  )
  expect_equal(result, expected)
})
