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
library(future)
library(progressr)
plan(multisession, workers = 2)
handlers(global = TRUE)
handlers("progress")

my_fcn <- function(xs) {
  p <- progressr::progressor(along = xs)
  future.apply::future_lapply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```


## Introduction

The **[futureverse]** framework, which provides a unified API for parallel
and distributed processing in R, has built-in support for the kind of
progression updates produced by the **progressr** package.  This means
that you can use it with for instance **[future.apply]**, **[furrr]**,
and **[foreach]** with **[doFuture]**, and **[plyr]** or
**[BiocParallel]** with **doFuture**.  In contrast, _non-future_
parallelization methods such as **parallel**'s `mclapply()` and,
`parallel::parLapply()`, and **foreach** adapters like **doParallel**
do _not_ support progress reports via **progressr**.


### future_lapply() - parallel lapply()

Here is an example that uses `future_lapply()` of the **[future.apply]** package to parallelize on the local machine while at the same time signaling progression updates:

```r
library(future.apply)
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  future_lapply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```


### foreach() with doFuture

Here is an example that uses `foreach()` of the **[foreach]** package
together with `%dofuture%` of the **[doFuture]** package to
parallelize while reporting on progress.  This example parallelizes on
the local machine, it works also for remote machines:

```r
library(doFuture)    ## %dofuture%
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)
handlers("progress")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %dofuture% {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```


For existing code using the traditional `%dopar%` operators of the
**[foreach]** package, we can register the **[doFuture]** adapter and
use the same **progressr** as above to progress updates;

```r
library(doFuture)
registerDoFuture()      ## %dopar% parallelizes via future
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)
handlers("progress")

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


### future_map() - parallel purrr::map()

Here is an example that uses `future_map()` of the **[furrr]** package
to parallelize on the local machine while at the same time signaling
progression updates:

```r
library(furrr)
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)
handlers("progress")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  future_map(xs, function(x) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

_Note:_ This solution does not involved the `.progress = TRUE`
argument that **furrr** implements.  Because **progressr** is more
generic and because `.progress = TRUE` only supports certain future
backends and produces errors on non-supported backends, I recommended
to stop using `.progress = TRUE` and use the **progressr** package
instead.


### BiocParallel::bplapply() - parallel lapply()

Here is an example that uses `bplapply()` of the **[BiocParallel]**
package to parallelize on the local machine while at the same time
signaling progression updates:

```r
library(BiocParallel)
library(doFuture)
register(DoparParam())  ## BiocParallel parallelizes via %dopar%
registerDoFuture()      ## %dopar% parallelizes via future
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)
handlers("progress")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  bplapply(xs, function(x) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```


### plyr::llply(..., .parallel = TRUE) with doFuture

Here is an example that uses `llply()` of the **[plyr]** package to
parallelize on the local machine while at the same time signaling
progression updates:

```r
library(plyr)
library(doFuture)
registerDoFuture()      ## %dopar% parallelizes via future
plan(multisession, workers = 2)

library(progressr)
handlers(global = TRUE)
handlers("progress")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  llply(xs, function(x, ...) {
    Sys.sleep((10.0-x)/2)
    p(sprintf("x=%g", x))
    sqrt(x)
  }, .parallel = TRUE)
}

y <- my_fcn(1:10)
# / [================>-----------------------------]  40% x=2
```

_Note:_ As an alternative to the above, recommended approach, one can
use `.progress = "progressr"` together with `.parallel = TRUE`.  This
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
results of the futures.  For instance, if `future_lapply(X, FUN)`
chunks up the processing of, say, 100 elements in `X` into eight
futures, we will see progress from each of the 100 elements as they
are done when using a future backend supporting "near-live" updates,
whereas we will only see those updated to be flushed eight times when
using any other types of future backends.

(*) Other future backends may gain support for "near-live" progress
updating later.  Adding support for those is independent of the
**progressr** package.  Feature requests for adding that support
should go to those future-backend packages.

[futureverse]: https://www.futureverse.org
[progressr]: https://progressr.futureverse.org
[future]: https://future.futureverse.org
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
