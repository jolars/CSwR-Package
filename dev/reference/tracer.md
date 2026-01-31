# Constructor of a tracer object

Tracer objects can collect, print and summarize trace information from
the evaluation environment of other functions during their evaluation.

## Usage

``` r
tracer(
  objects = NULL,
  Delta = 1,
  save = TRUE,
  time = TRUE,
  expr = NULL,
  plotter = NULL,
  ...
)
```

## Arguments

- objects:

  a character vector of names of the objects that are to be traced. The
  objects are searched for in the calling environment of the `tracer`
  function. Objects created by the `expr` argument can also be traced.

- Delta:

  an integer specifying if and how often trace information is printed.
  `Delta = 0` means never, and otherwise trace information is printed
  every `Delta`-th iteration. `Delta = 1` is the default.

- save:

  a logical value. Determines if the trace information is stored.

- time:

  a logical value. Determines if runtime information in seconds is
  traced.

- expr:

  an expression that will be evaluated in an environment that has the
  calling environment of the `tracer` function as parent.

- plotter:

  an expression, possibly created by the `plotter` function.

- ...:

  other arguments passed to `format` for printing and `plot.window`

## Value

A tracer object containing the functions `tracer`, `get` and `clear`.

## Details

The function `tracer` constructs a tracer object containing a `tracer`,
a `get` and a `clear` function. A call of the objects `tracer` function
can be inserted in other functions and used to collect, print and plot
trace information about the internals of that function during its
evaluation. The objects `get` function can access that information
afterwards, and its `clear` function deletes all stored values in the
tracer object.

A tracer object can trace time (in seconds) between `tracer` calls,
which are measured by the `hires_time` function from the bench package.
There are `print` and `summary` methods available for summarizing the
trace information. A call of the `tracer` function can be manually
inserted into the body of the function that is to be traced, it can be
inserted using [`base::trace`](https://rdrr.io/r/base/trace.html), or it
can be passed as an argument to any function with a callback argument.

## Examples

``` r
test_tracer <- tracer(c("m", "m_sq"), expr = quote(m_sq <- m^2))

test <- function(n, cb = NULL) {
  for(i in 1:n) {
    m <- 2 * i
    Sys.sleep(0.1)
    if(!is.null(cb)) cb()
    }
}

test(10, test_tracer$tracer)
#> n = 1: m = 2; m_sq = 4; 
#> n = 2: m = 4; m_sq = 16; 
#> n = 3: m = 6; m_sq = 36; 
#> n = 4: m = 8; m_sq = 64; 
#> n = 5: m = 10; m_sq = 100; 
#> n = 6: m = 12; m_sq = 144; 
#> n = 7: m = 14; m_sq = 196; 
#> n = 8: m = 16; m_sq = 256; 
#> n = 9: m = 18; m_sq = 324; 
#> n = 10: m = 20; m_sq = 400; 
summary(test_tracer)
#>     m m_sq     .time
#> 1   2    4 0.0000000
#> 2   4   16 0.1001382
#> 3   6   36 0.2003031
#> 4   8   64 0.3004732
#> 5  10  100 0.4006395
#> 6  12  144 0.5008068
#> 7  14  196 0.6009696
#> 8  16  256 0.7011909
#> 9  18  324 0.8014228
#> 10 20  400 0.9016244
```
