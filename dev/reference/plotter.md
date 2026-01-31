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
