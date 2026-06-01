# Summarize and print trace information

Summarize and print trace information

## Usage

``` r
# S3 method for class 'tracer'
summary(object, ...)

# S3 method for class 'tracer'
print(x, ...)
```

## Arguments

- object:

  a tracer object

- ...:

  other arguments (currently ignored)

- x:

  a tracer object

## Value

`summary` returns a data frame (of class trace) with columns containing
the values of the traced objects, and if time is traced an additional
column, `.time`, containing the cumulative runtime in seconds.

## Examples

``` r
tr <- tracer("i", Delta = 0)

for (i in 1:3) {
  tr$tracer()
}

summary(tr)
#>   i        .time
#> 1 1 0.000000e+00
#> 2 2 2.861023e-06
#> 3 3 5.006790e-06
print(tr)
#>   i        .time
#> 1 1 5.431175e-04
#> 2 2 2.861023e-06
#> 3 3 2.145767e-06
```
