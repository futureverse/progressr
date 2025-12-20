# progressr: An Inclusive, Unifying API for Progress Updates

The **[progressr](https://progressr.futureverse.org)** package provides
a minimal API for reporting progress updates in
[R](https://www.r-project.org/). The design is to separate the
representation of progress updates from how they are presented. What
type of progress to signal is controlled by the developer. How these
progress updates are rendered is controlled by the end user. For
instance, some users may prefer visual feedback such as a horizontal
progress bar in the terminal, whereas others may prefer auditory
feedback. The **[progressr](https://progressr.futureverse.org)**
framework is designed to work out-of-the-box also with parallel and
distributed processing, especially with the
**[futureverse](https://www.futureverse.org)** ecosystem.

![Three strokes writing three in
Chinese](articles/imgs/three_in_chinese.gif)

Design motto:

> The developer is responsible for providing progress updates but it’s
> only the end user who decides if, when, and how progress should be
> presented. No exceptions will be allowed.

## Two Minimal APIs - One For Developers and One For End-Users

[TABLE]

    

[TABLE]

## A simple example

Assume that we have a function
[`slow_sum()`](https://progressr.futureverse.org/reference/slow_sum.md)
for adding up the values in a vector. It is so slow, that we like to
provide progress updates to whoever might be interested in it. With the
**progressr** package, this can be done as:

``` r
slow_sum <- function(x) {
  p <- progressr::progressor(along = x)
  sum <- 0
  for (kk in seq_along(x)) {
    Sys.sleep(0.1)
    sum <- sum + x[kk]
    p(message = sprintf("Adding %g", x[kk]))
  }
  sum
}
```

Note how there are *no* arguments (e.g. `.progress = TRUE`) in the code
that specify how progress is presented. This is by design and because
the only task for the developer is to decide on where in the code it
makes sense to signal that progress has been made. As we will see next,
it should be up to the end user, and end user only, of this code to
decide whether they want to receive progress updates or not, and, if so,
in what format. Asking them to specify a special “progress” argument
adds a lot of friction, it clutters up the code, and, importantly, might
not even be possible for end users to do (e.g. they call a package
function that in turn calls the progress reporting function of
interest).

Now, if we call this function, without further settings:

``` r
> y <- slow_sum(1:10)
> y
[1] 55
>
```

the default is that there will be *no* progress updates. To get progress
updates, we need to request them to be “handled”, which we do by:

``` r
> progressr::handlers(global = TRUE)
```

After this, progress will be reported;

``` r
> y <- slow_sum(1:10)
  |====================                               |  40%
> y <- slow_sum(10:1)
  |========================================           |  80%
```

To disable reporting again, do:

``` r
> handlers(global = FALSE)
```

## Customizing how progress is reported

By default, **[progressr](https://progressr.futureverse.org)** presents
progress via the built-in
[`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html).
It presents itself as a rudimentary ASCII-based horizontal progress bar
in the R terminal. See
[`help("handler_txtprogressbar")`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)
for how to customize the look of “txtprogressbar”, e.g. colorization and
Unicode. There are many other ways to report on progress, including
visually, auditory, and via notification systems. You can also use a mix
of these, e.g.

``` r
handlers(c("cli", "beepr", "ntfy"))
```

See the ‘Customizing How Progress is Reported’ vignette for for
examples.

## Additional Features

### Support for progressr elsewhere

Note that progression updates by **progressr** is designed to work out
of the box for any iterator framework in R. See the different package
vignettes for details. Prominent examples are:

- [`lapply()`](https://rdrr.io/r/base/lapply.html) etc. of base R
- `map()` etc. by the
  **[purrr](https://cran.r-project.org/package=purrr)** package
- `llply()` etc. by the
  **[plyr](https://cran.r-project.org/package=plyr)** package
- `foreach()` iterations by the
  **[foreach](https://cran.r-project.org/package=foreach)** package

and near-live progress reporting in parallel and distributed processing
via the **[future](https://future.futureverse.org)** framework:

- `future_lapply()` etc. by the
  **[future.apply](https://future.apply.futureverse.org)** package
- `future_map()` etc. by the **[furrr](https://furrr.futureverse.org)**
  package
- `llply()` etc. by the
  **[plyr](https://cran.r-project.org/package=plyr)** and
  **[doFuture](https://doFuture.futureverse.org)** packages
- `foreach()` iterations via the **foreach** and
  **[doFuture](https://doFuture.futureverse.org)** packages
- `bplapply()` etc. by the
  **[BiocParallel](https://www.bioconductor.org/packages/BiocParallel/)**
  and **[doFuture](https://doFuture.futureverse.org)** packages

Other uses of **progressr** are:

- make packages that report progress via the
  **[cli](https://cran.r-project.org/package=cli)** package
  (e.g. **purrr**) report progress via **progressr**
- make `knit()` of the
  **[knitr](https://cran.r-project.org/package=knitr)** package report
  via **progressr**

### Use regular output as usual alongside progress updates

In contrast to other progress-bar frameworks, output from
[`message()`](https://rdrr.io/r/base/message.html),
[`cat()`](https://rdrr.io/r/base/cat.html),
[`print()`](https://rdrr.io/r/base/print.html) and so on, will *not*
interfere with progress reported via **progressr**. For example, say we
have:

``` r
slow_sqrt <- function(xs) {
  p <- progressor(along = xs)
  lapply(xs, function(x) {
    message("Calculating the square root of ", x)
    Sys.sleep(2)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}
```

we will get:

``` r
> library(progressr)
> handlers(global = TRUE)
> handlers("progress")
> y <- slow_sqrt(1:8)
Calculating the square root of 1
Calculating the square root of 2
- [===========>-----------------------------------]  25% x=2
```

This works because **progressr** will briefly buffer any output
internally and only release it when the next progress update is received
just before the progress is re-rendered in the terminal. This is why you
see a two second delay when running the above example. Note that, if we
use progress handlers that do not output to the terminal, such as
`handlers("beepr")`, then output does not have to be buffered and will
appear immediately.

*Comment*: When signaling a warning using
`warning(msg, immediate. = TRUE)` the message is immediately outputted
to the standard-error stream. However, this is not possible to emulate
when warnings are intercepted using calling handlers. This is a
limitation of R that cannot be worked around. Because of this, the above
call will behave the same as `warning(msg)` - that is, all warnings will
be buffered by R internally and released only when all computations are
done.

### Sticky messages

As seen above, some progress handlers present the progress message as
part of its output, e.g. the “progress” handler will display the message
as part of the progress bar. It is also possible to “push” the message
up together with other terminal output. This can be done by adding class
attribute `"sticky"` to the progression signaled. This works for several
progress handlers that output to the terminal. For example, with:

``` r
slow_sum <- function(x) {
  p <- progressr::progressor(along = x)
  sum <- 0
  for (kk in seq_along(x)) {
    Sys.sleep(0.1)
    sum <- sum + x[kk]
    p(sprintf("Step %d", kk), class = if (kk %% 5 == 0) "sticky", amount = 0)
    p(message = sprintf("Adding %g", x[kk]))
  }
  sum
}
```

we get

``` r
> handlers("txtprogressbar")
> y <- slow_sum(1:30)
Step 5
Step 10
  |====================                               |  43%
```

and

``` r
> handlers("progress")
> y <- slow_sum(1:30)
Step 5
Step 10
/ [===============>-------------------------]  43% Adding 13
```

## Installation

R package progressr is available on
[CRAN](https://cran.r-project.org/package=progressr) and can be
installed in R as:

``` r
install.packages("progressr")
```

### Pre-release version

To install the pre-release version that is available in Git branch
`develop` on GitHub, use:

``` r
remotes::install_github("futureverse/progressr", ref="develop")
```

This will install the package from source.
