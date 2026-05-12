# Subsetting tracer objects

Subsetting tracer objects

## Usage

``` r
# S3 method for class 'tracer'
x[i, j, ..., drop = TRUE]
```

## Arguments

- x:

  a tracer object.

- i:

  the indices of the trace information to extract.

- j:

  currently ignored.

- ...:

  other arguments passed on to `get`.

- drop:

  simplify a list with one element to a vector if TRUE.

## Value

a list

## Examples

``` r
tr <- tracer("i", Delta = 0)

for (i in 1:3) {
  tr$tracer()
}

tr[1]
#> $i
#> [1] 1
#> 
#> $.time
#> [1] 0.0005714893
#> 
```
