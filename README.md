

<div id="badges"><!-- pkgdown markup -->
<a href="https://CRAN.R-project.org/web/checks/check_results_progressr.html"><img border="0" src="https://www.r-pkg.org/badges/version/progressr" alt="CRAN check status"/></a> <a href="https://github.com/futureverse/progressr/actions?query=workflow%3AR-CMD-check"><img border="0" src="https://github.com/futureverse/progressr/actions/workflows/R-CMD-check.yaml/badge.svg?branch=develop" alt="R CMD check status"/></a> <a href="https://github.com/futureverse/progressr/actions?query=workflow%3Arevdepcheck-top"><img border="0" src="https://github.com/futureverse/progressr/actions/workflows/revdepcheck-top.yaml/badge.svg?branch=develop" alt="Top reverse-dependency checks status"/></a>    <a href="https://app.codecov.io/gh/futureverse/progressr"><img border="0" src="https://codecov.io/gh/futureverse/progressr/branch/develop/graph/badge.svg" alt="Coverage Status"/></a> <a href="https://lifecycle.r-lib.org/articles/stages.html"><img border="0" src="man/figures/lifecycle-maturing-blue.svg" alt="Life cycle: maturing"/></a>
</div>

# progressr: An Inclusive, Unifying API for Progress Updates 

The **[progressr]** package provides a minimal API for reporting
progress updates in [R](https://www.r-project.org/).  The design is to
separate the representation of progress updates from how they are
presented.  What type of progress to signal is controlled by the
developer.  How these progress updates are rendered is controlled by
the end user.  For instance, some users may prefer visual feedback
such as a horizontal progress bar in the terminal, whereas others may
prefer auditory feedback.


<img src="vignettes/imgs/three_in_chinese.gif" alt="Three strokes writing three in Chinese" style="float: right; margin-right: 1ex; margin-left: 1ex;"/>

Design motto:

> The developer is responsible for providing progress updates but it's
> only the end user who decides if, when, and how progress should be
> presented. No exceptions will be allowed.


## Two Minimal APIs - One For Developers and One For End-Users

<div style="overflow: hidden">
<div style="float: left">
<table style="border: 1px solid #999; box-shadow: 2px 2px 2px #999;">
<tr><th>Developer's API</th></tr>
<tr style="vertical-align: top">
<td>
<p>
1. Set up a progressor with a certain number of steps:
</p>
<pre>
p &lt;- progressor(nsteps)
p &lt;- progressor(along = x)
</pre>

<p>
2. Signal progress:
</p>

<pre>
p()               # one-step progress
p(amount = 0)     # "still alive"
p("loading ...")  # pass on a message
</pre>
</td>
</tr>
</table>
</div>
<div style="float: left">&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div style="float: left">
<table style="border: 1px solid #999; box-shadow: 2px 2px 2px #999;">
<tr><th>End-user's API</th></tr>
<tr style="vertical-align: top">
<td>
<p>
1a. Subscribe to progress updates from everywhere:
</p>

<pre>
handlers(global = TRUE)

y &lt;- slow_sum(1:5)
y &lt;- slow_sum(6:10)
</pre>

<p>
1b. Subscribe to a specific expression:
</p>

<pre>
with_progress({
  y &lt;- slow_sum(1:5)
  y &lt;- slow_sum(6:10)
})
</pre>

<p>
2. Configure how progress is presented:
</p>

<pre>
handlers("progress")
handlers("txtprogressbar", "beepr")
handlers(handler_pbcol(enable_after = 3.0))
handlers(handler_progress(complete = "#"))
</pre>
</td>
</table>
</div>
</div>

## A simple example

Assume that we have a function `slow_sum()` for adding up the values
in a vector.  It is so slow, that we like to provide progress updates
to whoever might be interested in it.  With the **progressr** package,
this can be done as:

```r
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

Note how there are _no_ arguments in the code that specifies how
progress is presented.  The only task for the developer is to decide
on where in the code it makes sense to signal that progress has been
made.  As we will see next, it is up to the end user of this code to
decide whether they want to receive progress updates or not, and, if
so, in what format.


### Without reporting on progress

When calling this function as in:
```r
> y <- slow_sum(1:10)
> y
[1] 55
>
``` 

it will behave as any function and there will be no progress
updates displayed.


### Reporting on progress

If we are only interested in progress for a particular call, we can
do:

```r
> library(progressr)
> with_progress(y <- slow_sum(1:10))
  |====================                               |  40%
```

However, if we want to report on progress from _every_ call, wrapping
the calls in `with_progress()` might become too cumbersome.  If so, we
can enable the global progress handler:

```r
> library(progressr)
> handlers(global = TRUE)
```

so that progress updates are reported on wherever signaled, e.g.

```r
> y <- slow_sum(1:10)
  |====================                               |  40%
> y <- slow_sum(10:1)
  |========================================           |  80%
```

This requires R 4.0.0 or newer.  To disable this again, do:

```r
> handlers(global = FALSE)
```

In the below examples, we will assume `handlers(global = TRUE)` is
already set.


## Customizing how progress is reported

### Terminal-based progress bars

The default is to present progress via `utils::txtProgressBar()`,
which is available on all R installations.  It presents itself as an
ASCII-based horizontal progress bar in the R terminal. This is
rendered as:

![SVG animation of the default "txtprogressbar" progress handler](vignettes/imgs/handler_txtprogressbar-default.svg)

We can tweak this "txtprogressbar" handler to use red hearts for the
bar, e.g.

```r
handlers(handler_txtprogressbar(char = cli::col_red(cli::symbol$heart)))
```

which results in:

![SVG animation of the "txtprogressbar" progress handler with red hearts](vignettes/imgs/handler_txtprogressbar-char-ansi.svg)

Another example is:

```r
handlers(handler_pbcol(
      adjust = 1.0,
    complete = function(s) cli::bg_red(cli::col_black(s)),
  incomplete = function(s) cli::bg_cyan(cli::col_black(s))
))
```

which results in:

![SVG animation of the "pbcol" progress handler with text aligned to the right](vignettes/imgs/handler_pbcol-adjust-right-complete.svg)

To change the default, to, say, `cli_progress_bar()` by the **[cli]**
package, set:

```r
handlers("cli")
```

This progress handler will present itself as:

![SVG animation of the default "cli" progress handler](vignettes/imgs/handler_cli-default.svg)

To instead use `progress_bar()` by the **[progress]** package, set:

```r
handlers("progress")
```
This progress handler will present itself as:

![SVG animation of the default "progress" progress handler](vignettes/imgs/handler_progress-default.svg)

To set the default progress handler, or handlers, in all your R
sessions, call `progressr::handlers(...)` in your
<code>~/.Rprofile</code> startup file.



### Auditory progress updates

Progress updates do not have to be presented visually. They can
equally well be communicated via audio. For example, using:

```r
handlers("beepr")
```

will present itself as sounds played at the beginning, while progressing, and at the end (using different **[beepr]** sounds).  There will be _no_ output written to the terminal;

```r
> y <- slow_sum(1:10)
> y
[1] 55
>
```


### Concurrent auditory and visual progress updates

It is possible to have multiple progress handlers presenting progress
updates at the same time.  For example, to get both visual and
auditory updates, use:

```r
handlers("txtprogressbar", "beepr")
```


### Silence all progress

To silence all progress updates, use:

```r
handlers("void")
```


### Further configuration of progress handlers

Above we have seen examples where the `handlers()` takes one or more
strings as input, e.g. `handlers(c("progress", "beepr"))`.  This is
short for a more flexible specification where we can pass a list of
handler functions, e.g.

```r
handlers(list(
  handler_progress(),
  handler_beepr()
))
```

With this construct, we can make adjustments to the default behavior
of these progress handlers.  For example, we can configure the
`format`, `width`, and `complete` arguments of
`progress::progress_bar$new()`, and tell **beepr** to use a different
`finish` sound and generate sounds at most every two seconds by
setting:

```r
handlers(list(
  handler_progress(
    format   = ":spin :current/:total (:message) [:bar] :percent in :elapsed ETA: :eta",
    width    = 60,
    complete = "+"
  ),
  handler_beepr(
    finish   = "wilhelm",
    interval = 2.0
  )
))
```


## Sticky messages

As seen above, some progress handlers present the progress message as
part of its output, e.g. the "progress" handler will display the
message as part of the progress bar.  It is also possible to "push"
the message up together with other terminal output.  This can be done
by adding class attribute `"sticky"` to the progression signaled.
This works for several progress handlers that output to the terminal.
For example, with:

```r
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

```r
> handlers("txtprogressbar")
> y <- slow_sum(1:30)
Step 5
Step 10
  |====================                               |  43%
```

and

```r
> handlers("progress")
> y <- slow_sum(1:30)
Step 5
Step 10
/ [===============>-------------------------]  43% Adding 13
```


## Use regular output as usual alongside progress updates

In contrast to other progress-bar frameworks, output from `message()`,
`cat()`, `print()` and so on, will _not_ interfere with progress
reported via **progressr**.  For example, say we have:

```r
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

```r
> library(progressr)
> handlers(global = TRUE)
> handlers("progress")
> y <- slow_sqrt(1:8)
Calculating the square root of 1
Calculating the square root of 2
- [===========>-----------------------------------]  25% x=2
```

This works because **progressr** will briefly buffer any output
internally and only release it when the next progress update is
received just before the progress is re-rendered in the terminal.
This is why you see a two second delay when running the above example.
Note that, if we use progress handlers that do not output to the
terminal, such as `handlers("beepr")`, then output does not have to be
buffered and will appear immediately.


_Comment_: When signaling a warning using `warning(msg, immediate. =
TRUE)` the message is immediately outputted to the standard-error
stream.  However, this is not possible to emulate when warnings are
intercepted using calling handlers, which are used by
`with_progress()`.  This is a limitation of R that cannot be worked
around.  Because of this, the above call will behave the same as
`warning(msg)` - that is, all warnings will be buffered by R
internally and released only when all computations are done.


## Support for progressr elsewhere

Note that progression updates by **progressr** is designed to work out
of the box for any iterator framework in R.  Below is an set of
examples for the most common ones.


### Base R Apply Functions

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

my_fcn(1:5)
#  |====================                               |  40%
```


### The foreach package

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

my_fcn(1:5)
#  |====================                               |  40%
```

### The purrr package

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

my_fcn(1:5)
#  |====================                               |  40%
```


### The plyr package

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

my_fcn(1:5)
#  |====================                               |  40%
```

Note how this solution does not make use of **plyr**'s `.progress`
argument, because the above solution is more powerful and more
flexible, e.g. we have more control on progress updates and their
messages.  However, if you prefer the traditional **plyr** approach,
you can use `.progress = "progressr"`, e.g. `y <- llply(..., .progress
= "progressr")`.




### The knitr package

When compiling ("knitting") an knitr-based vignette, for instance, via
`knitr::knit()`, **[knitr]** shows the progress of code chunks
processed thus far using a progress bar.  In **knitr** (>= 1.42) [to
be released as of 2022-12-12], we can use **progressr** for this
progress reporting.  To do this, set R option `knitr.progress.fun` as:

```r
options(knitr.progress.fun = function(total, labels) {
  p <- progressr::progressor(total, on_exit = FALSE)
  list(
    update = function(i) p(sprintf("chunk: %s", labels[i])),
    done = function() p(type = "finish")
  )
})
```

This configures **knitr** to signal progress via the **progressr**
framework.  To report on these, use:

```r
progressr::handlers(global = TRUE)
```


### Replace any cli progress bars with progressr updates

The **cli** package is used for progress reporting by many several
packages, notably tidyverse packages.  For instance, in **purrr**, you
can do:

```r
y <- purrr::map(1:100, \(x) Sys.sleep(0.1), .progress = TRUE)
```

to report on progress via the **cli** package as `map()` is iterating
over the elements.  Now, instead of using the default, built-in
**cli** progress bar, we can customize **cli** to report on progress
via **progressr** instead.  To do this, set R option
`cli.progress_handlers` as:

```r
options(cli.progress_handlers = "progressr")
```

With this option set, **cli** will now report on progress according to
your `progressr::handlers()` settings.  For example, with:

```r
progressr::handlers(c("beepr", "rstudio"))
```

will report on progress using **beepr** and the RStudio Console
progress panel.

To make **cli** report via **progressr** in all your R session, set
the above R option in your <code>~/.Rprofile</code> startup file.

_Note:_ A **cli** progress bar can have a "name", which can be
specfied in **purrr** function via argument `.progress`,
e.g. `.progress = "processing"`.  This name is then displayed in front
of the progress bar.  However, because the **progressr** framework
does not have a concept of progress "name", they are silently ignored
when using `options(cli.progress_handlers = "progressr")`.



## Parallel processing and progress updates

The **[future]** framework, which provides a unified API for parallel
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
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  future_lapply(xs, function(x, ...) {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

my_fcn(1:5)
# / [================>-----------------------------]  40% x=2
```


### foreach() with doFuture

Here is an example that uses `foreach()` of the **[foreach]** package
together with `%dofuture%` of the **[doFuture]** package to
parallelize while reporting on progress.  This example parallelizes on
the local machine, it works alsof for remote machines:

```r
library(doFuture)    ## %dofuture%
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %dofuture% {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  }
}

my_fcn(1:5)
# / [================>-----------------------------]  40% x=2
```


For existing code using the traditional `%dopar%` operators of the
**[foreach]** package, we can register the **[doFuture]** adaptor and
use the same **progressr** as above to progress updates;

```r
library(doFuture)
registerDoFuture()      ## %dopar% parallelizes via future
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  foreach(x = xs) %dopar% {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  }
}

my_fcn(1:5)
# / [================>-----------------------------]  40% x=2
```


### future_map() - parallel purrr::map()

Here is an example that uses `future_map()` of the **[furrr]** package
to parallelize on the local machine while at the same time signaling
progression updates:

```r
library(furrr)
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  future_map(xs, function(x) {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

my_fcn(1:5)
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
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  bplapply(xs, function(x) {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
}

my_fcn(1:5)
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
plan(multisession)

library(progressr)
handlers(global = TRUE)
handlers("progress", "beepr")

my_fcn <- function(xs) {
  p <- progressor(along = xs)
  llply(xs, function(x, ...) {
    Sys.sleep(6.0-x)
    p(sprintf("x=%g", x))
    sqrt(x)
  }, .parallel = TRUE)
}

my_fcn(1:5)
# / [================>-----------------------------]  40% x=2
```

_Note:_ As an alternative to the above, recommended approach, one can
use `.progress = "progressr"` together with `.parallel = TRUE`.  This
requires **plyr** (>= 1.8.7).


### Near-live versus buffered progress updates with futures

As of November 2020, there are four types of **future** backends that are known(*) to provide near-live progress updates:

 1. `sequential`,
 2. `multicore`,
 3. `multisession`, and
 4. `cluster` (local and remote)

Here "near-live" means that the progress handlers will report on
progress almost immediately when the progress is signaled on the
worker.  For all other future backends, the progress updates are only
relayed back to the main machine and reported together with the
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



## Note of caution - sending progress updates too frequently

Signaling progress updates comes with some overhead.  In situation
where we use progress updates, this overhead is typically much smaller
than the task we are processing in each step.  However, if the task we
iterate over is quick, then the extra time induced by the progress
updates might end up dominating the overall processing time.  If that
is the case, a simple solution is to only signal progress updates
every n:th step.  Here is a version of `slow_sum()` that signals
progress every 10:th iteration:

```
slow_sum <- function(x) {
  p <- progressr::progressor(length(x) / 10)
  sum <- 0
  for (kk in seq_along(x)) {
    Sys.sleep(0.1)
    sum <- sum + x[kk]
    if (kk %% 10 == 0) p(message = sprintf("Adding %g", x[kk]))
  }
  sum
}
```

The overhead of progress signaling may depend on context.  For
example, in parallel processing with near-live progress updates via
'multisession' futures, each progress update is communicated via a
socket connections back to the main R session.  These connections
might become clogged up if progress updates are too frequent.


## Progress updates in non-interactive mode ("batch mode")

When running R from the command line, R runs in a non-interactive mode
(`interactive()` returns `FALSE`).  The default behavior of
**progressr** is to _not_ report on progress in non-interactive mode.
To reported on progress also then, set R options `progressr.enable` or
environment variable `R_PROGRESSR_ENABLE` to `TRUE`.  For example,

```sh
$ Rscript -e "library(progressr)" -e "with_progress(y <- slow_sum(1:10))"
```

will _not_ report on progress, whereas

```sh
$ export R_PROGRESSR_ENABLE=TRUE
$ Rscript -e "library(progressr)" -e "with_progress(y <- slow_sum(1:10))"
```

will.



## Roadmap

Because this project is under active development, the progressr API is
currently kept at a very minimum.  This will allow for the framework
and the API to evolve while minimizing the risk for breaking code that
depends on it.  The roadmap for developing the API is roughly:

* [x] Provide minimal API for producing progress updates,
      i.e. `progressor()`, `with_progress()`, `handlers()`

* [x] Add support for global progress handlers removing the need for
      the user having to specify `with_progress()`,
      i.e. `handlers(global = TRUE)` and `handlers(global = FALSE)`

* [ ] Make it possible to create a progressor also in the global
      environment (see 'Known issues' below)

* [ ] Add support for nested progress updates

* [ ] Add API to allow users and package developers to design
      additional progression handlers

For a more up-to-date view on what features might be added, see
<https://github.com/futureverse/progressr/issues>.


## Appendix

### Known issues

#### A progressor cannot be created in the global environment

It is not possible to create a progressor in the global environment,
e.g. in the the top-level of a script.  It has to be created inside a
function, within `with_progress({ ... })`, `local({ ... })`, or a
similar construct.  For example, the following:

```r
library(progressr)
handlers(global = TRUE)

xs <- 1:5
p <- progressor(along = xs)
y <- lapply(xs, function(x) {
  Sys.sleep(0.1)
  p(sprintf("x=%g", x))
  sqrt(x)
})
```

results in an error if tried:

```
Error in progressor(along = xs) : 
  A progressor must not be created in the global environment unless wrapped in a
  with_progress() or without_progress() call. Alternatively, create it inside a
  function or in a local() environment to make sure there is a finite life span
  of the progressor
```

The solution is to wrap it in a `local({ ... })` call, or more
explicitly, in a `with_progress({ ... })` call:

```r
library(progressr)
handlers(global = TRUE)

xs <- 1:5
with_progress({
  p <- progressor(along = xs)
  y <- lapply(xs, function(x) {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
})
#  |====================                               |  40%
```

The main reason for this is to limit the life span of each progressor.
If we created it in the global environment, there is a significant
risk it would never finish and block all of the following progressors.


#### The global progress handler cannot be set everywhere

It is _not_ possible to call `handlers(global = TRUE)` in all
circumstances.  For example, it cannot be called within `tryCatch()`
and `withCallingHandlers()`;

```r
> tryCatch(handlers(global = TRUE), error = identity)
Error in globalCallingHandlers(NULL) : 
  should not be called with handlers on the stack
```

This is not a bug - neither in **progressr** nor in R itself. It's due
to a conservative design on how _global_ calling handlers should work
in R. If it allowed, there's a risk we might end up getting weird and
unpredictable behaviors when messages, warnings, errors, and other
types of conditions are signaled.

Because `tryCatch()` and `withCallingHandlers()` is used in many
places throughout base R, this means that we also cannot call
`handlers(global = TRUE)` as part of a package's startup process,
e.g. `.onLoad()` or `.onAttach()`.

Another example of this error is if `handlers(global = TRUE)` is used
inside package vignettes and dynamic documents such as Rmarkdown.  In
such cases, the global progress handler has to be enabled _prior_ to
processing the document, e.g.

```r
> progressr::handlers(global = TRUE)
> rmarkdown::render("input.Rmd")
```


### Under the hood

When using the **progressr** package, progression updates are
communicated via R's condition framework, which provides methods for
creating, signaling, capturing, muffling, and relaying conditions.
Progression updates are of classes `progression` and
`immediateCondition`(\*).  The below figure gives an example how
progression conditions are created, signaled, and rendered.

(\*) The `immediateCondition` class of conditions are relayed as soon
as possible by the **[future]** framework, which means that
progression updates produced in parallel workers are reported to the
end user as soon as the main R session have received them.




![](vignettes/imgs/slow_sum.svg)

_Figure: Sequence diagram illustrating how signaled progression
conditions are captured by `with_progress()`, or the global
progression handler, and relayed to the two progression handlers
'progress' (a progress bar in the terminal) and 'beepr' (auditory)
that the end user has chosen._


### Debugging

To debug progress updates, use:

```r
> handlers("debug")
> with_progress(y <- slow_sum(1:3))
[23:19:52.738] (0.000s => +0.002s) initiate: 0/3 (+0) '' {clear=TRUE, enabled=TRUE, status=}
[23:19:52.739] (0.001s => +0.000s) update: 0/3 (+0) '' {clear=TRUE, enabled=TRUE, status=}
[23:19:52.942] (0.203s => +0.002s) update: 0/3 (+0) '' {clear=TRUE, enabled=TRUE, status=}
[23:19:53.145] (0.407s => +0.001s) update: 0/3 (+0) '' {clear=TRUE, enabled=TRUE, status=}
[23:19:53.348] (0.610s => +0.002s) update: 1/3 (+1) 'P: Adding 1' {clear=TRUE, enabled=TRUE, status=}
M: Adding value 1
[23:19:53.555] (0.817s => +0.004s) update: 1/3 (+0) 'P: Adding 1' {clear=TRUE, enabled=TRUE, status=}
[23:19:53.758] (1.020s => +0.001s) update: 1/3 (+0) 'P: Adding 1' {clear=TRUE, enabled=TRUE, status=}
[23:19:53.961] (1.223s => +0.001s) update: 1/3 (+0) 'P: Adding 1' {clear=TRUE, enabled=TRUE, status=}
[23:19:54.165] (1.426s => +0.001s) update: 1/3 (+0) 'P: Adding 1' {clear=TRUE, enabled=TRUE, status=}
[23:19:54.368] (1.630s => +0.001s) update: 2/3 (+1) 'P: Adding 2' {clear=TRUE, enabled=TRUE, status=}
M: Adding value 2
[23:19:54.574] (1.835s => +0.003s) update: 2/3 (+0) 'P: Adding 2' {clear=TRUE, enabled=TRUE, status=}
[23:19:54.777] (2.039s => +0.001s) update: 2/3 (+0) 'P: Adding 2' {clear=TRUE, enabled=TRUE, status=}
[23:19:54.980] (2.242s => +0.001s) update: 2/3 (+0) 'P: Adding 2' {clear=TRUE, enabled=TRUE, status=}
[23:19:55.183] (2.445s => +0.001s) update: 2/3 (+0) 'P: Adding 2' {clear=TRUE, enabled=TRUE, status=}
[23:19:55.387] (2.649s => +0.001s) update: 3/3 (+1) 'P: Adding 3' {clear=TRUE, enabled=TRUE, status=}
[23:19:55.388] (2.650s => +0.003s) update: 3/3 (+0) 'P: Adding 3' {clear=TRUE, enabled=TRUE, status=}
M: Adding value 3
[23:19:55.795] (3.057s => +0.000s) shutdown: 3/3 (+0) 'P: Adding 3' {clear=TRUE, enabled=TRUE, status=ok}
```



[progressr]: https://cran.r-project.org/package=progressr
[beepr]: https://cran.r-project.org/package=beepr
[cli]: https://cran.r-project.org/package=cli
[progress]: https://cran.r-project.org/package=progress
[purrr]: https://cran.r-project.org/package=purrr
[future]: https://cran.r-project.org/package=future
[foreach]: https://cran.r-project.org/package=foreach
[future.apply]: https://cran.r-project.org/package=future.apply
[doParallel]: https://cran.r-project.org/package=doParallel
[doFuture]: https://cran.r-project.org/package=doFuture
[furrr]: https://cran.r-project.org/package=furrr
[knitr]: https://cran.r-project.org/package=knitr
[pbapply]: https://cran.r-project.org/package=pbapply
[pbmcapply]: https://cran.r-project.org/package=pbmcapply
[plyr]: https://cran.r-project.org/package=plyr
[BiocParallel]: https://www.bioconductor.org/packages/BiocParallel/

## Installation
R package progressr is available on [CRAN](https://cran.r-project.org/package=progressr) and can be installed in R as:
```r
install.packages("progressr")
```


### Pre-release version

To install the pre-release version that is available in Git branch `develop` on GitHub, use:
```r
remotes::install_github("futureverse/progressr", ref="develop")
```
This will install the package from source.  

<!-- pkgdown-drop-below -->


## Contributing

To contribute to this package, please see [CONTRIBUTING.md](CONTRIBUTING.md).

