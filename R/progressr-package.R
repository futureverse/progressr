#' progressr: A Unifying API for Progress Updates
#'
#' The \pkg{progressr} package provides a minimal, unifying API for scripts
#' and packages to report progress updates from anywhere including when
#' using parallel processing.
#'
#' The package is designed such that _the developer_ can to focus on _what_
#' progress should be reported on without having to worry about _how_ to
#' present it.
#'
#' The _end user_ has full control of _how_, _where_, and _when_ to render
#' these progress updates.  For instance, they can chose to report progress
#' in the terminal using [utils::txtProgressBar()] (default) or
#' [cli::cli_progress_bar()], via the R graphical user interface (GUI)
#' using `utils::winProgressBar()` or [tcltk::tkProgressBar()], or
#' via the RStudio GUI using `rstudioapi::jobSetProgress()`.
#' An alternative to above visual rendering, is to report progress as audio
#' using [beepr::beep()].
#' It is also possible to use a combination of above progression handlers,
#' e.g. a progress bar in the terminal together with audio updates.
#' Besides the existing handlers, it is possible to develop custom
#' progression handlers.
#'
#' The \pkg{progressr} package is compatible with \pkg{shiny} applications
#' and \pkg{knitr} rendering.
#'
#' The \pkg{progressr} package uses R's condition framework for signaling
#' progress updated. Because of this, progress can be reported from almost
#' anywhere in R, e.g. from classical for and while loops, from map-reduce
#' APIs like the [lapply()] family of functions, \pkg{purrr}, \pkg{plyr}, and
#' \pkg{foreach}.
#' The \pkg{progressr} package will also work with parallel processing via
#' the \pkg{future} framework, e.g. [future.apply::future_lapply()],
#' [furrr::future_map()], and [foreach::foreach()] with \pkg{doFuture}.
#'
#' @section Progression Handlers:
#'
#' In the terminal:
#' * [handler_txtprogressbar] (built-in; default)
#' * [handler_pbcol] (built-in)
#' * [handler_ascii_alert] (built-in)
#' * [handler_pbmcapply] (requires the \pkg{pbmcapply} package)
#' * [handler_progress] (requires the \pkg{progress} package)
#'
#' In a graphical user interface (GUI):
#' * [handler_rstudio] (only in the RStudio Console)
#' * [handler_tkprogressbar] (built-in)
#' * [handler_winprogressbar] (built-in)
#'
#' As sound:
#' * [handler_ascii_alert] (built-in)
#' * [handler_beepr] (requires the \pkg{beepr} package)
#'
#' Via the file system:
#' * [handler_filesize] (built-in)
#'
#' In Shiny:
#' * [withProgressShiny] (requires the \pkg{shiny} package)
#'
#' Via notification systems:
#' * [handler_ntfy] (requires the \pkg{ntfy} package)
#' * [handler_notifier] (requires the non-CRAN \pkg{notifier} package)
#' * [handler_rpushbullet] (requires the \pkg{RPushBullet} package)
#'
#' Miscellaneous:
#' * [handler_debug] (built-in)
#' * [handler_newline] (built-in)
#' * [handler_slowdown] (built-in)
#' * [handler_void] (built-in)
#'
#' @example incl/progressr-package.R
#'
#' @keywords programming iteration
#'
#' @aliases progressr-package
#' @name progressr
"_PACKAGE"
