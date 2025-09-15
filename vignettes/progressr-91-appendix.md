<!--
%\VignetteIndexEntry{progressr: Appendix}
%\VignetteAuthor{Henrik Bengtsson}
%\VignetteKeyword{R}
%\VignetteKeyword{package}
%\VignetteKeyword{vignette}
%\VignetteKeyword{packages}
%\VignetteEngine{progressr::selfonly}
-->

## How tos

### Report on progress in non-interactive mode ("batch mode")

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


## Notes of caution

### Avoid sending progress updates too frequently

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


## Known Limitations

### The global progress handler cannot be set during package load

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


### A progressor cannot be created in the global environment

It is not possible to create a progressor in the global environment,
e.g. in the the top-level of a script. It can only be created inside a
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



## Design and Implementation

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

![](imgs/slow_sum.svg)

_Figure: Sequence diagram illustrating how signaled progression
conditions are captured by `with_progress()`, or the global
progression handler, and relayed to the two progression handlers
'progress' (a progress bar in the terminal) and 'beepr' (auditory)
that the end user has chosen._


### Roadmap

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
      environment (see 'Known issues' above)

* [ ] Add support for nested progress updates

* [ ] Add API to allow users and package developers to design
      additional progression handlers

For a more up-to-date view on what features might be added, see
<https://github.com/futureverse/progressr/issues>.


[progressr]: https://progressr.futureverse.org
[future]: https://future.futureverse.org

