test_that("plotter creates an expression", {
  p <- plotter("x")
  expect_true(is.call(p) || is.expression(p))
})

test_that("plotter accepts color argument", {
  p <- plotter("x", col = "red")
  expect_true(is.call(p))
  # Check that the expression was created successfully
  expect_true(length(p) > 0)
})

test_that("plotter accepts line type argument", {
  p <- plotter("x", lty = "dashed")
  expect_true(is.call(p))
  # Check that the expression was created successfully
  expect_true(length(p) > 0)
})

test_that("plotter accepts point character argument", {
  p <- plotter("x", pch = 16)
  expect_true(is.call(p))
  # Check that the expression was created successfully
  expect_true(length(p) > 0)
})
