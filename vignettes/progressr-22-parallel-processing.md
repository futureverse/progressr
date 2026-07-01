<!--
%\VignetteIndexEntry{progressr: Parallel and Distributed Processing}
%\VignetteAuthor{Henrik Bengtsson}
%\VignetteKeyword{R}
%\VignetteKeyword{package}
%\VignetteKeyword{vignette}
%\VignetteKeyword{progress}
%\VignetteKeyword{parallel}
%\VignetteKeyword{distributed}
%\VignetteEngine{progressr::selfonly}
-->

## TL;DR

The **progressr** package works seamlessly with parallel and
distributed processing using **[futureverse]**, and it will also
provide near-live progress updates while the parallel processing is
still running. For example,

```r
library(progressr)
handlers("progress", global = TRUE)

library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressr::progressor(along = xs)
  lapply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }) |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

Alternatively, we can use `progressify()` from the **[progressify]** package
to automatically add progress reporting without modifying the function's
internal code:

```r
library(progressify)
handlers("progress", global = TRUE)

library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  lapply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    sqrt(x)
  }) |> progressify() |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40%
```

## Introduction

The **[futureverse]** framework, which provides a unified API for parallel
and distributed processing in R, has built-in support for the kind of
progression updates produced by the **progressr** package.  The modern,
recommended approach to parallelize such code is using `futurize()` from
the **[futurize]** package, which supports common map-reduce and iteration
functions like `lapply()`, `purrr::map()`, `foreach()`, `bplapply()`, and
`llply()`.

Traditional parallelization packages such as **[future.apply]**, **[furrr]**,
and **[foreach]** with **[doFuture]** (specifically, `%dofuture%` or registered
via `registerDoFuture()`) are still fully supported and can be used as alternatives.

In contrast, _non-future_ parallelization methods such as **parallel**'s
`mclapply()` and `parallel::parLapply()`, and **foreach** adapters like
**doParallel** do _not_ support progress reports via **progressr**.

### lapply() with futurize()

Here is an example that uses `futurize()` of the **[futurize]** package to parallelize a standard `lapply()` call on the local machine while at the same time signaling progression updates:

```r
library(progressr)
handlers("progress", global = TRUE)

library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  lapply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }) |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

Note that using `future_lapply()` of the **[future.apply]** package is still supported as a traditional alternative.

### foreach() with futurize()

Here is an example that uses `foreach()` of the **[foreach]** package
together with `futurize()` of the **[futurize]** package to
parallelize a standard sequential `%do%` loop while reporting on progress.
This example parallelizes on the local machine; it works also for remote machines:

```r
library(progressr)
handlers("progress", global = TRUE)

library(foreach)
library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %do% {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  } |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

Note that using the `%dofuture%` operator of the **[doFuture]** package,
or traditional `%dopar%` registered via `registerDoFuture()`, is still supported.
For example:

```r
library(progressr)
handlers("progress", global = TRUE)

library(doFuture)
registerDoFuture()      ## %dopar% parallelizes via future
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %dopar% {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

### purrr::map() with futurize()

Here is an example that uses `purrr::map()` and `futurize()` to parallelize
on the local machine while at the same time signaling progression updates:

```r
library(progressr)
handlers("progress", global = TRUE)

library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  purrr::map(xs, function(x) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }) |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

_Note:_ Using `future_map()` of the **[furrr]** package is still supported.
This solution does not involve the `.progress = TRUE`
argument that **furrr** implements.  Because **progressr** is more
generic and because `.progress = TRUE` only supports certain future
backends and produces errors on non-supported backends, I recommend
to stop using `.progress = TRUE` and use the **progressr** package
instead.

### BiocParallel::bplapply() with futurize()

Here is an example that uses `bplapply()` of the **[BiocParallel]**
package and `futurize()` to parallelize on the local machine while
at the same time signaling progression updates:

```r
library(progressr)
handlers("progress", global = TRUE)

library(BiocParallel)
library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  bplapply(xs, function(x) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }) |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

### plyr::llply() with futurize()

Here is an example that uses `llply()` of the **[plyr]** package and
`futurize()` to parallelize on the local machine while at the same
time signaling progression updates:

```r
library(progressr)
handlers("progress", global = TRUE)

library(plyr)
library(futurize)
plan(multisession, workers = 2)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  llply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }) |> futurize()
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

_Note:_ As an alternative to the above, recommended approach, one can
use `.progress = "progressr"` together with `.parallel = TRUE` and the **[doFuture]** package.  This
requires **plyr** (>= 1.8.7).

### Near-live versus buffered progress updates with futures

As of August 2025, there are six types of **future** backends that are
known(*) to provide near-live progress updates:

 1. `sequential`,
 2. `multicore`,
 3. `multisession`, and
 4. `cluster` (local and remote)
 5. `future.callr::callr`
 6. `future.mirai::mirai_multisession`

Here "near-live" means that the progress handlers will report on
progress almost immediately when the progress is signaled on the
worker. This is because these parallel backends handle the special
condition class `immediateCondition` - they detect when such
conditions are signaled and relay them to the parent R process as soon
as possible. For all other future backends, the progress updates are
only relayed back to the main machine and reported together with the
results of the futures.  For instance, if `lapply(X, FUN) |> futurize()`
chunks up the processing of, say, 100 elements in `X` into eight
futures, we will see progress from each of the 100 elements as they
are done when using a future backend supporting "near-live" updates,
whereas we will only see those updates flushed eight times when
using any other types of future backends.

(*) Other future backends may gain support for "near-live" progress
updating later.  Adding support for those is independent of the
**progressr** package.  Feature requests for adding that support
should go to those future-backend packages.

[futureverse]: https://www.futureverse.org
[progressr]: https://progressr.futureverse.org
[future]: https://future.futureverse.org
[futurize]: https://futurize.futureverse.org
[progressify]: https://progressify.futureverse.org
[future.apply]: https://future.apply.futureverse.org
[furrr]: https://furrr.futureverse.org
[doFuture]: https://doFuture.futureverse.org
[progress]: https://cran.r-project.org/package=progress
[purrr]: https://cran.r-project.org/package=purrr
[foreach]: https://cran.r-project.org/package=foreach
[doParallel]: https://cran.r-project.org/package=doParallel
[knitr]: https://cran.r-project.org/package=knitr
[plyr]: https://cran.r-project.org/package=plyr
[BiocParallel]: https://www.bioconductor.org/packages/BiocParallel/
