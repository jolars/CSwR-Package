test_that("tracer object is created correctly", {
  tr <- tracer(c("x", "y"))
  expect_s3_class(tr, "tracer")
  expect_true(is.list(tr))
  expect_true(is.function(tr$tracer))
  expect_true(is.function(tr$get))
  expect_true(is.function(tr$clear))
})

test_that("tracer collects values correctly", {
  tr <- tracer(c("x", "y"), Delta = 0, save = TRUE, time = FALSE)

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      x <- i
      y <- i^2
      cb()
    }
  }

  test_fun(5, tr$tracer)

  values <- tr$get()
  expect_length(values, 5)
  expect_equal(values[[1]]$x, 1)
  expect_equal(values[[1]]$y, 1)
  expect_equal(values[[5]]$x, 5)
  expect_equal(values[[5]]$y, 25)
})

test_that("tracer with expression works", {
  tr <- tracer(
    c("m", "m_sq"),
    expr = quote(m_sq <- m^2),
    Delta = 0,
    time = FALSE
  )

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      m <- 2 * i
      cb()
    }
  }

  test_fun(3, tr$tracer)

  values <- tr$get()
  expect_length(values, 3)
  expect_equal(values[[1]]$m, 2)
  expect_equal(values[[1]]$m_sq, 4)
  expect_equal(values[[3]]$m, 6)
  expect_equal(values[[3]]$m_sq, 36)
})

test_that("tracer clear works", {
  tr <- tracer(c("x"), Delta = 0, time = FALSE)

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      x <- i
      cb()
    }
  }

  test_fun(3, tr$tracer)
  expect_length(tr$get(), 3)

  tr$clear()
  expect_length(tr$get(), 0)
})

test_that("tracer subsetting works", {
  tr <- tracer(c("x"), Delta = 0, time = FALSE)

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      x <- i
      cb()
    }
  }

  test_fun(5, tr$tracer)

  expect_equal(tr[1]$x, 1)
  expect_equal(tr[5]$x, 5)
  expect_length(tr[1:3], 3)
})

test_that("summary.tracer works", {
  tr <- tracer(c("x"), Delta = 0, time = TRUE)

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      x <- i
      cb()
    }
  }

  test_fun(3, tr$tracer)

  s <- summary(tr)
  expect_s3_class(s, "trace")
  expect_s3_class(s, "data.frame")
  expect_equal(nrow(s), 3)
  expect_true(".time" %in% colnames(s))
})

test_that("tracer with time tracking works", {
  tr <- tracer(c("x"), Delta = 0, save = TRUE, time = TRUE)

  test_fun <- function(n, cb) {
    for (i in 1:n) {
      x <- i
      Sys.sleep(0.01)
      cb()
    }
  }

  test_fun(2, tr$tracer)

  values <- tr$get()
  expect_true(".time" %in% names(values[[1]]))
  expect_true(values[[1]]$.time >= 0)
})
