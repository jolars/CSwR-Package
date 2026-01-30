test_that("terminator object is created correctly", {
  term <- terminator()
  expect_s3_class(term, "terminator")
  expect_true(is.list(term))
  expect_true(is.function(term$terminator))
  expect_true(is.function(term$clear))
})

test_that("terminator with simple condition works", {
  term <- terminator(cond = FALSE, Delta = 1, print = FALSE)
  expect_false(term$terminator())
})

test_that("terminator with expression condition works", {
  term <- terminator(cond = quote(x > 5), Delta = 1, print = FALSE)

  test_fun <- function(cb) {
    for (i in 1:10) {
      x <- i
      if (cb()) break
    }
    x
  }

  result <- test_fun(term$terminator)
  expect_equal(result, 6) # Should stop when x > 5
})

test_that("terminator clear works", {
  term <- terminator(cond = quote(x > 3), Delta = 1, print = FALSE)

  test_fun <- function(cb) {
    for (i in 1:10) {
      x <- i
      if (cb()) break
    }
    x
  }

  result1 <- test_fun(term$terminator)
  expect_equal(result1, 4)

  term$clear()
  result2 <- test_fun(term$terminator)
  expect_equal(result2, 4) # Should work the same after clear
})

test_that("terminator with Delta works", {
  counter <- 0
  term <- terminator(cond = FALSE, Delta = 2, print = FALSE)

  for (i in 1:6) {
    term$terminator()
    counter <- counter + 1
  }

  expect_equal(counter, 6) # Should complete all iterations
})

test_that("print.terminator works", {
  term <- terminator(cond = FALSE, Delta = 1, print = FALSE)
  term$terminator()
  # Just check that print doesn't error
  expect_no_error(print(term))
})
