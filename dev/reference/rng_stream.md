# Random number stream based on caching

A random number stream uses a vectorized random number generator to
generate a cache of random numbers that can then be used sequentially.
Whenever the cache runs empty new numbers are generated automatically.

## Usage

``` r
rng_stream(m, rng, ...)
```

## Arguments

- m:

  initial cache size

- rng:

  a random number generator

- ...:

  additional arguments passed to the random number generator

## Value

A function that extracts random numbers from the cache and fills the
cache whenever it runs empty.

## Examples

``` r
runif_stream <- rng_stream(10, runif, min = -1, max = 1)
runif_stream()
#> [1] -0.9852011
```
