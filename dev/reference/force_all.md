# Force evaluation of all arguments to a function

Forces the evaluation of all arguments in the calling environment of
this function.

## Usage

``` r
force_all(...)
```

## Arguments

- ...:

  arguments captured by ... are also evaluated if passed via ...

## Value

NULL invisibly

## Details

Use `force_all()` as syntactic sugar to force evaluation of all
arguments to a function and thereby circumvent lazy evaluation. If
called from within a function with `...` as formal argument, use
`force_all(...)` to force evaluation of arguments captured by `...`.

## See also

[`force()`](https://rdrr.io/r/base/force.html)

## Examples

``` r
affine <- function(a, b) {
  function(x) a * x + b
}
a <- 1
b <- 1
affine_11 <- affine(a, b)
a <- 2
b <- 2
affine_11(1) # Gives 4 and not 2 due to lazy evaluation
#> [1] 4

affine_forced <- function(a, b) {
  force_all()
  function(x) a * x + b
}
a <- 1
b <- 1
affine_11 <- affine_forced(a, b)
a <- 2
b <- 2
affine_11(1) # Gives 2
#> [1] 2
```
