# Constructor of plotter expression

The plotter function returns a quoted expression that adds points to a
current plot. For use with tracer and terminator objects to iteratively
update plots during long running function evaluations.

## Usage

``` r
plotter(y, col = "black", lty = "solid", pch = 1)
```

## Arguments

- y:

  a name of a symbol to plot

- col:

  point and line color

- lty:

  line type

- pch:

  plot symbol

## Value

a quoted expression

## Examples

``` r
plotter("i")
#> {
#>     .__y_val <- get("i")
#>     points(.__n, .__y_val, col = "black", pch = 1)
#>     if (exists(".__n_old") && exists(".__y_val_old")) {
#>         lines(c(.__n_old, .__n), c(.__y_val_old, .__y_val), col = "black", 
#>             lty = "solid")
#>     }
#>     .__n_old <- .__n
#>     .__y_val_old <- .__y_val
#> }
```
