
<!-- README.md is generated from README.Rmd. Please edit that file -->
tidycat <img src="man/figures/logo.png" width="160px" align="right" />
======================================================================

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

🎓 Tidy tools for academics

\*\*\* This package is in very early development. Feedback is encouraged!!! \*\*\*
----------------------------------------------------------------------------------

Installation
------------

<!-- You can install the released version of tidycat from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tidycat")
```
-->
Install the development version from [Github](https://github.com/mkearney/tidycat) with:

``` r
## install devtools if not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
## install tidycat from Github
devtools::install_github("mkearney/tidycat")
```

Load the package (it, of course, plays nicely with tidyverse).

``` r
## load tidyverse
library(tidyverse)

## load tidycat
library(tidycat)
```

### t-tests

``` r
polcom %>%
  tidy_ttest(pp_ideology ~ follow_trump) %>%
  tidy_summary()
#> # A tidy model
#> Model formula  : pp_ideology ~ follow_trump
#> Model type     : T-test
#> Model pkg::fun : stats::t.test()
#> Model data     : 244 (observations)
#> $fit
#> group       df     mean      diff     lo.95     hi.05
#> FALSE  76.911    4.185     0.922     0.308     1.536
#> TRUE   76.911    3.263    -0.922    -0.308    -1.536
#> 
#> $coef
#>     est        t    p.value  stars
#>  0.922    2.992      0.004   **
```
