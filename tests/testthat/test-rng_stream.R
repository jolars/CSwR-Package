test_that("rng_stream creates a function", {
  stream <- rng_stream(10, runif)
  expect_true(is.function(stream))
})

test_that("rng_stream generates random numbers", {
  stream <- rng_stream(10, runif)
  val1 <- stream()
  val2 <- stream()
  expect_true(is.numeric(val1))
  expect_true(is.numeric(val2))
  expect_length(val1, 1)
  expect_length(val2, 1)
})

test_that("rng_stream passes arguments correctly", {
  stream <- rng_stream(10, runif, min = -1, max = 1)
  vals <- replicate(20, stream())
  expect_true(all(vals >= -1))
  expect_true(all(vals <= 1))
})

test_that("rng_stream refills cache correctly", {
  stream <- rng_stream(5, runif)
  # Generate more than cache size
  vals <- replicate(10, stream())
  expect_length(vals, 10)
  expect_true(all(vals >= 0))
  expect_true(all(vals <= 1))
})

test_that("rng_stream works with different RNGs", {
  stream_norm <- rng_stream(10, rnorm, mean = 5, sd = 2)
  vals <- replicate(20, stream_norm())
  expect_true(is.numeric(vals))
  expect_length(vals, 20)
})
