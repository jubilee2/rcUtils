# test-parseLogs.R

# Test case 1: Simple key-value pair
test_that("logDetailsParseRecord works for simple key-value pair", {
  test_details <- "name = 'John', age = '30'"
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list(name = "John", age = "30")
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
  test_details <- "name = 'Jane', hobbies(1) = checked, age = '25', hobbies(2) = unchecked"
  result <- logDetailsParseRecord(test_details)[[1]]
  expected <- list(name = "Jane", hobbies___1 = "1", age = "25", hobbies___2 = "0")
  expect_equal(result, expected)
})

# Test case 4: Unparseable content
test_that("logDetailsParseRecord warns for unparseable content", {
  test_details <- "name = 'Bob', invalid_content"
  expect_warning(logDetailsParseRecord(test_details), "unparseable content")
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
