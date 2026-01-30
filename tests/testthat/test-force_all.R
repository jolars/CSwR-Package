test_that("force_all forces evaluation", {
  affine_lazy <- function(a, b) {
    function(x) a * x + b
  }

  affine_forced <- function(a, b) {
    force_all()
    function(x) a * x + b
  }

  # Test lazy evaluation (without force_all)
  a <- 1
  b <- 1
  f_lazy <- affine_lazy(a, b)
  a <- 2
  b <- 2
  expect_equal(f_lazy(1), 4) # Uses new values due to lazy evaluation

  # Test forced evaluation (with force_all)
  a <- 1
  b <- 1
  f_forced <- affine_forced(a, b)
  a <- 2
  b <- 2
  expect_equal(f_forced(1), 2) # Uses original values
})

test_that("force_all returns NULL invisibly", {
  result <- withVisible(force_all())
  expect_null(result$value)
  expect_false(result$visible)
})

test_that("force_all works with ... arguments", {
  test_fun <- function(a, b, ...) {
    force_all(...)
    list(a, b, list(...))
  }

  result <- test_fun(1, 2, x = 3, y = 4)
  expect_equal(result[[1]], 1)
  expect_equal(result[[2]], 2)
  expect_named(result[[3]], c("x", "y"))
})
