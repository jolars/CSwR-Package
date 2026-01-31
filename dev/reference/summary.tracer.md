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
