# Test 1: Valid input, single type
test_that("logFilter returns correct result for single type", {
  actions <- c("Manage/Design", "Data export")
  types <- "manage"
  expected <- c(TRUE, FALSE)
  expect_equal(logFilter(actions, types), expected)
})

# Test 2: Valid input, multiple types
test_that("logFilter returns correct result for multiple types", {
  actions <- c("Manage/Design", "Data export", "Create record")
  types <- c("manage", "export", "record")
  expected <- c(TRUE, TRUE, TRUE)
  expect_equal(logFilter(actions, types), expected)
})

# Test 3: Valid input, 'all' types
test_that("logFilter returns correct result for 'all' types", {
  actions <- c("Manage/Design", "Data export", "Create record")
  types <- "all"
  expected <- c(TRUE, TRUE, TRUE)
  expect_equal(logFilter(actions, types), expected)
})

# Test 4: Invalid input, non-character actions
test_that("logFilter throws error for non-character actions", {
  actions <- c(1, 2, 3)
  types <- "manage"
  expect_error(logFilter(actions, types), "actions must be a character vector")
})

# Test 5: Invalid input, non-character types
test_that("logFilter throws error for non-character types", {
  actions <- c("Manage/Design", "Data export")
  types <- c(1, 2)
  expect_error(logFilter(actions, types), "types must be a character vector")
})

# Test 6: Invalid input, unsupported type
test_that("logFilter throws error for unsupported type", {
  actions <- c("Manage/Design", "Data export")
  types <- "invalid"
  expect_error(logFilter(actions, types), "Unsupported type: 'invalid'")
})

# Test 7: NA actions
test_that("logFilter handles NA actions correctly", {
  actions <- c("Manage/Design", NA, "Data export")
  types <- "manage"
  expected <- c(TRUE, FALSE, FALSE)
  expect_equal(logFilter(actions, types), expected)
})
