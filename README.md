

# CSwR

<!-- badges: start -->

[![R build
status](https://github.com/jolars/CSwR-Package/workflows/R-CMD-check/badge.svg)](https://github.com/jolars/CSwR-Package/actions)
[![Code
coverage](https://codecov.io/gh/jolars/CSwR-Package/graph/badge.svg)](https://app.codecov.io/gh/jolars/CSwR-Package)
<!-- badges: end -->

The CSwR package is a companion to the book *Computational Statistics
with R* available at [cswr.nrhstat.org](https://cswr.nrhstat.org). It
provides data and utility functions used throughout the book for
teaching computational statistics concepts.

## Installation

You can install the development version from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("jolars/CSwR-Package")
```

## Features

The package includes:

- **Datasets**: Five datasets used in examples throughout the book:

  - `greenland` - Monthly temperature data from southwest Greenland
    (1873-2013)
  - `nuuk` - Annual temperature summaries for Nuuk (1867-2013)
  - `vegetables` - Weekly frozen vegetable sales data
  - `angle` - Torsion angles from protein structure (1HMP)
  - `news` - Social media news sharing features from Mashable articles

- **Tracer objects** (`tracer()`) - Collect, print, and visualize trace
  information during function evaluation for debugging and performance
  analysis

- **Terminator objects** (`terminator()`) - Define termination
  conditions for iterative algorithms with callback support

- **Random number streams** (`rng_stream()`) - Efficient cached random
  number generation

- **Force evaluation** (`force_all()`) - Utility to force evaluation of
  all function arguments and avoid lazy evaluation pitfalls

- **Plotter expressions** (`plotter()`) - Create expressions for
  iterative plot updates during long-running computations

## Usage

``` r
library(CSwR)

# Load and explore datasets
data(greenland)
head(greenland)
```

      Year Month Temp_nuuk Temp_Qaqortoq Temp_diff
    1 1873     1     -12.1          -9.9      -2.2
    2 1874     1     -13.1         -11.6      -1.5
    3 1875     1      -6.6          -6.3      -0.3
    4 1876     1     -11.1          -8.3      -2.8
    5 1877     1     -14.5          -8.8      -5.7
    6 1878     1      -7.7          -6.8      -0.9

``` r
# Create a tracer for monitoring algorithm progress
tr <- tracer(c("x", "residual"), time = TRUE)
# Use tr$tracer as a callback in your iterative function

# Set up a terminator with a convergence condition
term <- terminator(cond = quote(residual < 1e-6), Delta = 10)
# Returns TRUE when condition is met
```

## Documentation

For detailed documentation and examples, visit the [package
website](https://jolars.github.io/CSwR-Package/) or see the book at
[cswr.nrhstat.org](https://cswr.nrhstat.org).

## License

MIT License
