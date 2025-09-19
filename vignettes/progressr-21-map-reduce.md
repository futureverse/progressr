<!--
%\VignetteIndexEntry{progressr: Map-Reduce Calls, e.g. lapply() and map()}
%\VignetteAuthor{Henrik Bengtsson}
%\VignetteKeyword{R}
%\VignetteKeyword{package}
%\VignetteKeyword{vignette}
%\VignetteKeyword{lapply}
%\VignetteKeyword{foreach}
%\VignetteKeyword{purrr}
%\VignetteKeyword{plyr}
%\VignetteEngine{progressr::selfonly}
-->

Progress updates by **[progressr]** is designed to work out of the box
for any iterator framework in R, e.g. `lapply()`, **[foreach]**,
**[purrr]**, and **[plyr]**. Below you will a set of examples that
illustrate how to use **progressr** in common use cases.


## Base R apply functions

```r
library(progressr)
handlers(global = TRUE)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  lapply(xs, function(x) {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
#  |====================                               |  40%
```


## The foreach package

```r
library(foreach)
library(progressr)
handlers(global = TRUE)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %do% {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  }
}

y <- my_fcn(1:10)
#  |====================                               |  40%
```


## The purrr package

```r
library(purrr)
library(progressr)
handlers(global = TRUE)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  map(xs, function(x) {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
#  |====================                               |  40%
```


## The plyr package

```r
library(plyr)
library(progressr)
handlers(global = TRUE)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  llply(xs, function(x, ...) {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
#  |====================                               |  40%
```

Note how this solution does not make use of **plyr**'s `.progress`
argument, because the above solution is more powerful and more
flexible, e.g. we have more control on progress updates and their
messages.  However, if you prefer the traditional **plyr** approach,
you can use `.progress = "progressr"`, e.g. `y <- llply(..., .progress
= "progressr")`.


[progressr]: https://progressr.futureverse.org
[purrr]: https://cran.r-project.org/package=purrr
[foreach]: https://cran.r-project.org/package=foreach
[plyr]: https://cran.r-project.org/package=plyr
