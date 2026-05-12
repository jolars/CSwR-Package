# Constructor of a terminator object

Terminator objects are used to write termination conditions that can be
tested via a callback function within another function during its
evaluation.

## Usage

``` r
terminator(cond = FALSE, Delta = 1, print = TRUE, plotter = NULL, ...)
```

## Arguments

- cond:

  a termination condition. Either an expression or call that evaluates
  to a logical.

- Delta:

  an integer specifying how often the termination condition is
  evaluated. `Delta = 0` means never, and otherwise the condition is
  evaluated every `Delta`-th iteration. `Delta = 1` is the default.

- print:

  a variable name to print or a logical. If FALSE, nothing is printed.
  If a variable name is given, that variable (if it exists) will be
  printed every `Delta`-th iteration. If TRUE (the default) the last
  variable in `cond` is printed every `Delta`-th iteration.

- plotter:

  an expression, possibly created by the `plotter` function.

- ...:

  other arguments passed to `format` for printing and `plot.window`

## Value

A terminator object containing the functions `terminator` and `clear`.

## Details

Terminator objects are similar to tracer objects but serve a different
purpose. Like tracer objects, they can be used to trace, print and plot
values of a variable within the evaluation environment of another
function during its evaluation. The primary purpose of a terminator
object is, however, to evaluate a termination condition, which can
trigger termination of a loop. Terminator objects do not save trace
information and do not trace runtime.
