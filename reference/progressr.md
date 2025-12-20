# progressr: A Unifying API for Progress Updates

The progressr package provides a minimal, unifying API for scripts and
packages to report progress updates from anywhere including when using
parallel processing.

## Details

The package is designed such that *the developer* can to focus on *what*
progress should be reported on without having to worry about *how* to
present it.

The *end user* has full control of *how*, *where*, and *when* to render
these progress updates. For instance, they can chose to report progress
in the terminal using
[`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html)
(default) or
[`cli::cli_progress_bar()`](https://cli.r-lib.org/reference/cli_progress_bar.html),
via the R graphical user interface (GUI) using
[`utils::winProgressBar()`](https://rdrr.io/r/utils/winProgressBar.html)
or
[`tcltk::tkProgressBar()`](https://rdrr.io/r/tcltk/tkProgressBar.html),
or via the RStudio GUI using
[`rstudioapi::jobSetProgress()`](https://rstudio.github.io/rstudioapi/reference/jobSetProgress.html).
An alternative to above visual rendering, is to report progress as audio
using [`beepr::beep()`](https://rdrr.io/pkg/beepr/man/beep.html). It is
also possible to use a combination of above progression handlers, e.g. a
progress bar in the terminal together with audio updates. Besides the
existing handlers, it is possible to develop custom progression
handlers.

The progressr package is compatible with shiny applications and knitr
rendering.

The progressr package uses R's condition framework for signaling
progress updated. Because of this, progress can be reported from almost
anywhere in R, e.g. from classical for and while loops, from map-reduce
APIs like the [`lapply()`](https://rdrr.io/r/base/lapply.html) family of
functions, purrr, plyr, and foreach. The progressr package will also
work with parallel processing via the future framework, e.g.
[`future.apply::future_lapply()`](https://future.apply.futureverse.org/reference/future_lapply.html),
[`furrr::future_map()`](https://furrr.futureverse.org/reference/future_map.html),
and [`foreach::foreach()`](https://rdrr.io/pkg/foreach/man/foreach.html)
with doFuture.

## Progression Handlers

In the terminal:

- [handler_txtprogressbar](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)
  (built-in; default)

- [handler_pbcol](https://progressr.futureverse.org/reference/handler_pbcol.md)
  (built-in)

- [handler_ascii_alert](https://progressr.futureverse.org/reference/handler_ascii_alert.md)
  (built-in)

- [handler_pbmcapply](https://progressr.futureverse.org/reference/handler_pbmcapply.md)
  (requires the pbmcapply package)

- [handler_progress](https://progressr.futureverse.org/reference/handler_progress.md)
  (requires the progress package)

In a graphical user interface (GUI):

- [handler_rstudio](https://progressr.futureverse.org/reference/handler_rstudio.md)
  (only in the RStudio Console)

- [handler_tkprogressbar](https://progressr.futureverse.org/reference/handler_tkprogressbar.md)
  (built-in)

- [handler_winprogressbar](https://progressr.futureverse.org/reference/handler_winprogressbar.md)
  (built-in)

As sound:

- [handler_ascii_alert](https://progressr.futureverse.org/reference/handler_ascii_alert.md)
  (built-in)

- [handler_beepr](https://progressr.futureverse.org/reference/handler_beepr.md)
  (requires the beepr package)

Via the file system:

- [handler_filesize](https://progressr.futureverse.org/reference/handler_filesize.md)
  (built-in)

In Shiny:

- [withProgressShiny](https://progressr.futureverse.org/reference/withProgressShiny.md)
  (requires the shiny package)

Via notification systems:

- [handler_ntfy](https://progressr.futureverse.org/reference/handler_ntfy.md)
  (requires the ntfy package)

- [handler_notifier](https://progressr.futureverse.org/reference/handler_notifier.md)
  (requires the non-CRAN notifier package)

- [handler_rpushbullet](https://progressr.futureverse.org/reference/handler_rpushbullet.md)
  (requires the RPushBullet package)

Miscellaneous:

- [handler_debug](https://progressr.futureverse.org/reference/handler_debug.md)
  (built-in)

- [handler_newline](https://progressr.futureverse.org/reference/handler_newline.md)
  (built-in)

- [handler_slowdown](https://progressr.futureverse.org/reference/handler_slowdown.md)
  (built-in)

- [handler_void](https://progressr.futureverse.org/reference/handler_void.md)
  (built-in)

## See also

Useful links:

- <https://progressr.futureverse.org>

- <https://github.com/futureverse/progressr>

- Report bugs at <https://github.com/futureverse/progressr/issues>

## Author

**Maintainer**: Henrik Bengtsson <henrikb@braju.com>
([ORCID](https://orcid.org/0000-0002-7579-5165)) \[copyright holder\]

## Examples

``` r
library(progressr)

xs <- 1:5

with_progress({
  p <- progressor(along = xs)
  y <- lapply(xs, function(x) {
    Sys.sleep(0.1)
    p(sprintf("x=%g", x))
    sqrt(x)
  })
})
```
