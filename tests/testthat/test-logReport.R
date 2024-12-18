
test_that("queryLogSummary returns data frame", {
  logs <- data.frame(timestamp = Sys.time(), username = "user123", details = "Open data query")
  result <- queryLogSummary(logs)
  expect_s3_class(result, "data.frame")
})

test_that("queryLogSummary has correct columns", {
  logs <- data.frame(timestamp = Sys.time(), username = "user123", details = "Open data query")
  result <- queryLogSummary(logs)
  expect_setequal(names(result), c("timestamp", "username", "Action", "Record", "Event", "Field", "Data Quality Rule", "Comment"))
})

test_that("queryLogSummary handles empty logs", {
  logs <- data.frame(timestamp = Sys.time(), username = 'foo', details = '')
  result <- queryLogSummary(logs)
  expect_equal(nrow(result), 0)
})

test_that("queryLogSummary handles NA details", {
  logs <- data.frame(timestamp = Sys.time(), username = "user123", details = NA)
  result <- queryLogSummary(logs)
  expect_equal(nrow(result), 0)
})
