# Print terminator information

Print terminator information

## Usage

``` r
# S3 method for class 'terminator'
print(x, ...)
```

## Arguments

- x:

  a terminator object

- ...:

  other arguments (currently ignored)

## Value

The list of objects from the terminator's evaluation environment,
returned invisibly.

## Examples

``` r
term <- terminator(quote(i >= 3), print = FALSE)

for (i in 1:5) {
  if (term$terminator()) {
    break
  }
}

print(term, all.names = TRUE)
#> $.__n
#> [1] 4
#> 
```
